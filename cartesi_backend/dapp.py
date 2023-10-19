from os import environ
import logging
import requests
import re
from eth_abi import encode
import json

from cartesi import DApp, Rollup, RollupData, JSONRouter, URLRouter, URLParameters
from cartesi.models import _hex2str

from models import *
from settings import Settings

# logging.basicConfig(level="DEBUG")
logging.basicConfig(level="INFO")
logger = logging.getLogger(__name__)

rollup_server = environ["ROLLUP_HTTP_SERVER_URL"]
logger.info(f"HTTP rollup_server url is {rollup_server}")



dapp = DApp()
json_router = JSONRouter()
url_router = URLRouter()
dapp.add_router(json_router)
dapp.add_router(url_router)

riders_manager = RidersManager()
drivers_manager = DriversManager()
trips_manager = TripsManager()
bank = Bank()
settings = Settings()

#
# Utils
#

ERC20_PORTAL_ADDRESS: str = '0x9C21AEb2093C32DDbC53eEF24B873BDCd1aDa1DB'
ERC20_TRANSFER_FUNCTION_SELECTOR = b'\xa9\x05\x9c\xbb'

def get_path_params(data: RollupData, path_spec: str) -> dict:
    # process input data
    path = data.str_payload()
    result = re.match(path_spec, path)
    if result is None:
        raise ""
    return result.groupdict()

def send_voucher(voucher):
    send_post("voucher",voucher)

def send_post(endpoint,json_data):
    response = requests.post(rollup_server + f"/{endpoint}", json=json_data)
    logger.info(f"/{endpoint}: Received response status {response.status_code} body {response.content}")

def create_erc20_transfer_voucher(token_address,receiver,amount):
    # Function to be called in voucher [token_address].transfer([address receiver],[uint256 amount])
    data = encode(['address', 'uint256'], [receiver,amount])
    voucher_payload = binary2hex(ERC20_TRANSFER_FUNCTION_SELECTOR + data)
    voucher = {"destination": token_address, "payload": voucher_payload}
    return voucher

def str2hex(str):
    return "0x" + str.encode("utf-8").hex()

def to_jsonhex(data):
    return str2hex(json.dumps(data))

def hex2binary(hexstr: str):
    return bytes.fromhex(hexstr[2:])

def binary2hex(binary):
    return "0x" + binary.hex()

def decode_erc20_deposit(binary):
    ret = binary[:1]
    token_address = binary[1:21]
    depositor = binary[21:41]
    amount = int.from_bytes(binary[41:73], "big")
    data = binary[73:]
    erc20_deposit = {
        "depositor":binary2hex(depositor),
        "token_address":binary2hex(token_address),
        "amount":amount,
        "data":data
    }
    logger.info(erc20_deposit)
    return erc20_deposit

def process_deposit(rollup: Rollup, data: RollupData) -> dict:
    binary = hex2binary(data.payload)

    erc20_deposit = decode_erc20_deposit(binary)

    token_address = erc20_deposit["token_address"]
    depositor = erc20_deposit["depositor"]
    amount = erc20_deposit["amount"]

    if token_address.lower() != settings.accepted_erc20_token.lower():  
        voucher = create_erc20_transfer_voucher(token_address,depositor,amount)
        logger.info(f"Token not accepted, sending it back, voucher {voucher}")
        send_voucher(voucher)
        return True

    # add to wallet
    try: bank.deposit(depositor,amount)
    except Exception as e:
        msg = f"Could not deposit {amount} for user {depositor}. Error: {e}"
        logger.warning(msg)
        rollup.report(str2hex(msg))
        return False

    # send notice with current balance
    rollup.notice(str2hex(f"{{\"action\":\"deposit\",\"address\":\"{depositor}\",\"balance\":\"{bank.balance(depositor)}\"}}"))

    return True

#
# Advance routes
#

# default error route
@dapp.advance()
def default_handler(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Running Default Handler")

    # handle deposits
    if data.metadata.msg_sender.lower() == ERC20_PORTAL_ADDRESS.lower():   
        logger.info("Processing Erc20 deposit") 
        return process_deposit(rollup, data)

    msg = f"Nothing to do here"
    logger.warning(msg)
    rollup.report(str2hex(msg))
    return False


# submit trip requests
@json_router.advance({'action': 'withdraw'})
def withdraw(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Withdraw request")

    payload = WithdrawInput.parse_obj(data.json_payload())
    
    user = data.metadata.msg_sender
    amout = payload.amount

    # remove from wallet
    try: bank.withdraw(user,amount)
    except Exception as e:
        msg = f"Could not Withdraw {amount} for user {user}. Error: {e}"
        logger.warning(mag)
        rollup.report(str2hex(msg))
        return False

    # generate voucher
    voucher = create_erc20_transfer_voucher(settings.accepted_erc20_token,user,amount)
    send_voucher(voucher)

    # send notice with current balance
    rollup.notice(str2hex(f"{{\"action\":\"withdraw\",\"address\":\"{user}\",\"balance\":\"{bank.balance(user)}\"}}"))

    logger.info(f"Withdrawing {amount} for user {user}")

    return True

# apply for driver
@json_router.advance({'action': 'driver_application'})
def driver_application(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Running driver application")
    
    try: 
        bank.transfer(data.metadata.msg_sender,settings.security_deposits_address,settings.security_deposit_value)
        drivers_manager.register_deposit(data.metadata.msg_sender,settings.security_deposit_value)
        driver = drivers_manager.create(data.metadata.msg_sender)
    except Exception as e:
        msg = f"Could create driver. Error: {e}"
        logger.warning(msg)
        rollup.report(str2hex(msg))
        return False

    # send notice with current balance
    rollup.notice(str2hex(f"{{\"action\":\"driver_application\",\"address\":\"{data.metadata.msg_sender}\",\"balance\":\"{bank.balance(data.metadata.msg_sender)}\"}}"))

    logger.info(f"Depositing {settings.security_deposit_value} for driver application of {data.metadata.msg_sender}")

    return True

# return driver security deposit
@json_router.advance({'action': 'return_security_deposit'})
def return_security_deposit(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Running driver application")

    driver = drivers_manager.get(data.metadata.msg_sender)
    if driver is None:
        msg = f"Couldn't get driver."
        logger.warning(msg)
        rollup.report(str2hex(msg))
        return False

    if driver.n_trips < settings.security_deposit_min_n_trip:
        msg = f"Can't get security deposit back. Driver should have {settings.security_deposit_min_n_trip} trips"
        logger.warning(msg)
        rollup.report(str2hex(msg))
        return False

    amount = drivers_manager.register_withdraw(driver.address)
    if amount == 0:
        msg = f"Couldn't get security deposit back. Current {amount=}"
        logger.warning(msg)
        rollup.report(str2hex(msg))
        return False

    bank.transfer(settings.security_deposits_address,data.metadata.msg_sender,amount)

    # send notice with current balance
    rollup.notice(str2hex(f"{{\"action\":\"return_security_deposit\",\"address\":\"{data.metadata.msg_sender}\",\"balance\":\"{bank.balance(data.metadata.msg_sender)}\"}}"))

    logger.info(f"Returning {settings.security_deposit_value} for driver application of {data.metadata.msg_sender}")

    return True

    # TODO: extraordinary way to get deposit back (DAO based)

# submit trip requests
@json_router.advance({'action': 'trip_request'})
def trip_request(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Running trip request")
    # geohash origin, destination, trip estimate (distance, payment value), public key
    # will generate trip id

    payload = TripRequestInput.parse_obj(data.json_payload())

    rider = riders_manager.get(data.metadata.msg_sender)

    # check if rider has enough balance
    if not trips_manager.has_enough_balance(payload,bank.balance(data.metadata.msg_sender)):
        msg = f"Not enough balance to request trip trip. It should be {settings.trip_request_min_balance} times the estimated value"
        logger.warning(msg)
        rollup.report(str2hex(msg))
        return False

    try: trips_manager.create(data.metadata.timestamp,rider,payload)
    except Exception as e:
        msg = f"Couldn't create trip. Error: {e}"
        logger.warning(msg)
        rollup.report(str2hex(msg))
        return False

    # send notice with trip id and status
    trip_id = trips_manager.riders_trip.get(data.metadata.msg_sender)
    trip = trips_manager.trips.get(trip_id)
    rollup.notice(str2hex(f"{{\"action\":\"trip_request\",\"address\",\"{data.metadata.msg_sender}\",\"trip\":\"{trip.id}\",\"status\":\"{trip.status}\"}}"))

    return True

# offer trip
@json_router.advance({'action': 'offer_trip'})
def offer_trip(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Running offer trip")
    # trip id, current geohash, reputation

    payload = TripOfferInput.parse_obj(data.json_payload())

    driver = drivers_manager.get(data.metadata.msg_sender)
    if driver is None:
        msg = f"Couldn't get driver."
        logger.warning(msg)
        rollup.report(str2hex(msg))
        return False

    # will verify eta
    # can not accept multiple trips at the same time
    # update trip offer list
    try: trips_manager.add_offer(data.metadata.timestamp,driver,payload)
    except Exception as e:
        msg = f"Couldn't create offer. Error: {e}"
        logger.warning(msg)
        rollup.report(str2hex(msg))
        return False

    # send notice with trip id and status
    trip_id = trips_manager.drivers_offer.get(data.metadata.msg_sender)
    trip = trips_manager.trips.get(trip_id)
    rollup.notice(str2hex(f"{{\"action\":\"offer_trip\",\"address\",\"{data.metadata.msg_sender}\",\"trip\":\"{trip.id}\",\"status\":\"{trip.status}\"}}"))

    return True

# cancel offer
@json_router.advance({'action': 'cancel_offer'})
def cancel_offer(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Running accept trip")

    try: trips_manager.cancel_offer(data.metadata.msg_sender)
    except Exception as e:
        msg = f"Couldn't cancel offer. Error: {e}"
        logger.warning(msg)
        rollup.report(str2hex(msg))
        return False

    rollup.notice(str2hex(f"{{\"action\":\"cancel_offer\",\"address\":\"{data.metadata.msg_sender}\"}}"))

    return True

# cancel trip_request
@json_router.advance({'action': 'cancel_request'})
def cancel_request(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Running accept trip")

    try: trips_manager.cancel_trip_request(data.metadata.msg_sender)
    except Exception as e:
        msg = f"Couldn't cancel offer. Error: {e}"
        logger.warning(msg)
        rollup.report(str2hex(msg))
        return False

    rollup.notice(str2hex(f"{{\"action\":\"cancel_request\",\"address\":\"{data.metadata.msg_sender}\"}}"))

    return True

# accept trip offer
@json_router.advance({'action': 'accept_trip'})
def accept_trip(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Running accept trip")
    # trip id, address of the driver

    payload = AcceptOfferInput.parse_obj(data.json_payload())

    rider = riders_manager.get(data.metadata.msg_sender)

    try: trips_manager.accept_offer(data.metadata.timestamp,rider,payload)
    except Exception as e:
        msg = f"Couldn't accept offer. Error: {e}"
        logger.warning(msg)
        rollup.report(str2hex(msg))
        return False

    # send notice with trip id and status
    trip_id = trips_manager.riders_trip.get(data.metadata.msg_sender)
    trip = trips_manager.trips.get(trip_id)
    rollup.notice(str2hex(f"{{\"action\":\"accept_trip\",\"address\",\"{data.metadata.msg_sender}\",\"trip\":\"{trip.id}\",\"status\":\"{trip.status}\"}}"))

    return True


# TODO: allow cancel trip (driver) and trip give up (rider)


# finish trip
@json_router.advance({'action': 'finish_trip'})
def finish_trip(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Running finish trip")
    # trip id, extra data
    # do everything that need to be done
    #   rider -> send reputation, payment transactions
    #   driver -> payment transactions
    #   Disputes
    return True


#
# Inspect routes
#


# get balance
# get trip info by driver offer
@url_router.inspect('balance/{addr}')
def balance(rollup: Rollup, params: URLParameters) -> bool:
    logger.info(f"Running balance {params.path_params=}")

    user = params.path_params['addr']
    rollup.report(str2hex(f"{{\"address\":\"{user}\",\"balance\":\"{bank.balance(user)}\"}}"))

    return True


# get trip requests available for my position
@url_router.inspect('match_trips/{geohash}')
def get_trip_requests_near(rollup: Rollup, params: URLParameters) -> bool:
    logger.info(f"Running near trip requests {params.path_params=}")

    # match geohash and send list of nearby trip requests
    trips_near = trips_manager.match_trips(params.path_params['geohash'])

    # send report
    rollup.report(to_jsonhex(trips_near))

    return True

# get trip info
@url_router.inspect('trip/{trip_id}')
def get_trip_info(rollup: Rollup, params: URLParameters) -> bool:
    logger.info(f"Running trip info {params.path_params=}")

    trip = trips_manager.get(params.path_params['trip_id'])

    # send report
    if trip is not None: rollup.report(str2hex(trip.json()))

    return True

# get trip info by driver offer
@url_router.inspect('trip_by_driver_offer/{addr}')
def get_trip_info(rollup: Rollup, params: URLParameters) -> bool:
    logger.info(f"Running trip info by driver offer {params.path_params=}")

    trip = trips_manager.get_trip_by_driver_offer(params.path_params['addr'])

    # send report
    if trip is not None: rollup.report(str2hex(trip.json()))

    return True

# get trip info by driver
@url_router.inspect('trip_by_driver/{addr}')
def get_trip_info(rollup: Rollup, params: URLParameters) -> bool:
    logger.info(f"Running trip info by driver {params.path_params=}")

    trip = trips_manager.get_trip_by_driver(params.path_params['addr'])

    # send report
    if trip is not None: rollup.report(str2hex(trip.json()))

    return True

# get trip info by rider
@url_router.inspect('trip_by_rider/{addr}')
def get_trip_info(rollup: Rollup, params: URLParameters) -> bool:
    logger.info(f"Running trip info by rider {params.path_params=}")

    trip = trips_manager.get_trip_by_rider(params.path_params['addr'])

    # send report
    if trip is not None: rollup.report(str2hex(trip.json()))

    return True

# get route from points
ROUTE_REQUEST = r'route/(?P<lon1>[0-9.]+),(?P<lat1>[0-9.]+);(?P<lon2>[0-9.]+),(?P<lat2>[0-9.]+)'
# TODO: change to @url_router.inspect('route') params.query_params['lat1']...
@url_router.inspect(ROUTE_REQUEST) 
def get_route(rollup: Rollup, data: RollupData) -> bool:
    logger.info(f"Running route request")

    # process input data
    result = get_path_params(data, ROUTE_REQUEST)
    logger.info(f"{result=}")

    # TODO: get osrm route
    # route_result = requests.get(f"http://127.0.0.1:8080:...{result['lon1']},{result['lat1']};{result['lon2']},{result['lat2']}")

    # send report
    rollup.report('0x') # + hex encoded response 

    return True


if __name__ == '__main__':
    dapp.run()

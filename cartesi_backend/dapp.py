from os import environ
import logging
import requests
import re
from eth_abi import encode
import json

from cartesi import DApp, Rollup, RollupData, JSONRouter, URLRouter, URLParameters
from cartesi.models import _hex2str

from models import Rider,Driver,Trip,Offer,TripsManager,Bank
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

    if token_address.lower() == settings.accepted_erc20_token.lower():  
        voucher = create_erc20_transfer_voucher(settings.accepted_erc20_token,depositor,amount)
        logger.info(f"Token not accepted, sending it back, voucher {voucher}")
        send_voucher(voucher)

    # add to wallet
    try: bank.deposit(depositor,amount)
    except Exception as e:
        logger.warn(f"Could not deposit {amount} for user {depositor}. Error: {e}")
        return False

    # send notice with current balance
    rollup.notice(to_jsonhex(f"\"address\":\"{depositor}\",\"balance\":\"{bank.balance(depositor)}\""))

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

    logger.warn(f"Nothing to do here")
    return False


# submit trip requests
@json_router.advance({'action': 'withdraw'})
def withdraw(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Withdraw request")

    payload = Withdraw.parse_obj(data.json_payload())
    
    user = data.metadata.msg_sender
    amout = payload.amount

    # remove from wallet
    try: bank.withdraw(user,amount)
    except Exception as e:
        logger.warn(f"Could not Withdraw {amount} for user {user}. Error: {e}")
        return False

    # generate voucher
    voucher = create_erc20_transfer_voucher(settings.accepted_erc20_token,user,amount)
    send_voucher(voucher)

    # send notice with current balance
    rollup.notice(to_jsonhex(f"\"address\":\"{user}\",\"balance\":\"{bank.balance(user)}\""))

    logger.info(f"Withdrawing {amount} for user {user}")

    return True

# submit trip requests
@json_router.advance({'action': 'trip_request'})
def trip_request(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Running trip request")
    # geohash origin, destination, trip estimate (distance, payment value), public key
    # will generate trip id

    payload = TripRequestInput.parse_obj(data.json_payload())
    trip = None
    try: trip = trips.create(data.metadata.msg_sender,data.metadata.timestamp,payload)
    except Exception as e:
        logger.warn(f"Could create trip. Error: {e}")
        return False

    rollup.notice(to_jsonhex(f"\"trip\":\"{trip.id}\",\"status\":\"{trip.status}\""))

    # send report with trip id
    rollup.notice('0x') # + hex encoded response 

    return True

# offer trip
@json_router.advance({'action': 'trip_offer'})
def offer_trip(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Running offer trip")
    # trip id, current geohash, reputation
    # will calculate eta
    # can accept multiple trips at the same time
    # update trip offer list

    return True

# accept trip offer
@json_router.advance({'action': 'accept_trip'})
def accept_trip(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Running accept trip")
    # trip id, address of the driver

    # send report with trip id
    rollup.notice('0x') # + hex encoded response 

    return True

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


# get trip requests available for my position
@url_router.inspect('trip_requests/{geohash}')
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
    rollup.report(to_jsonhex(trip)) # + hex encoded response 

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

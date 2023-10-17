from os import environ
import logging
import requests
import re

from cartesi import DApp, Rollup, RollupData, JSONRouter, URLRouter
from cartesi.models import _hex2str

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

#
# Utils
#

def get_path_params(data: RollupData, path_spec: str) -> dict:
    # process input data
    path = data.str_payload()
    result = re.match(path_spec, path)
    if result is None:
        raise ""
    return result.groupdict()

#
# Advance routes
#

# default error route
@dapp.advance()
def default_handler(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Running Default Handler")
    logger.debug(f"Nothing to do here")


# submit trip requests
@json_router.advance({'action': 'trip_request'})
def trip_request(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Running trip request")
    # geohash origin, destination, trip estimate (distance, payment value), public key
    # will generate trip id

    # send report with trip id
    rollup.notice('0x') # + hex encoded response 

    return True

# offer trip
@json_router.advance({'action': 'offer_trip'})
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
TRIP_REQUESTS = r'trip_requests/(?P<geohash>[0-9a-z]+)'
@url_router.inspect(TRIP_REQUESTS)
def get_trip_requests(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Running trip requests")
    # match geohash and send list of trip requests

    # send report
    rollup.report('0x') # + hex encoded response 

    return True

# get trip info like offers
TRIP_INFO = r'trip/(?P<id>[0-9A-Za-z]+)'
@url_router.inspect(TRIP_INFO)
def get_trip_info(rollup: Rollup, data: RollupData) -> bool:
    logger.info("Running trip info")

    # send report
    rollup.report('0x') # + hex encoded response 

    return True

# get route from points
ROUTE_REQUEST = r'route/(?P<lon1>[0-9.]+),(?P<lat1>[0-9.]+);(?P<lon2>[0-9.]+),(?P<lat2>[0-9.]+)'
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

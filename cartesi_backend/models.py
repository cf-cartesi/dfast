from pydantic import BaseModel
from enum import Enum
from pytrie import StringTrie 
import uuid
from settings import Settings

settings = Settings()

class Wallet(BaseModel):
    # note: it considers a single asset (and can't change asset)
    owner: str
    balance: int = 0

class Rider(BaseModel):
    address: str

class Driver(BaseModel):
    address: str
    n_trips: int = 0
    reputation: int = 6

class Offer(BaseModel):
    # trip_id
    driver_address: str
    driver_geohash: str
    timestamp: int
    distance: int
    eta: int


class TripStatusEnum(str, Enum):
    open = 'open'
    in_progress = 'in_progress'
    waiting_confirmation = 'waiting_confirmation'
    ended = 'ended'

class Trip(BaseModel):
    id: str
    request_timestamp: int
    start_timestamp: int
    end_timestamp: int
    confirmation_timestamp: int
    rider: str

    geohash_origin: str
    geohash_destination: str
    trip_commitment: str
    estimated_distance: str
    timeout: int

    offers: dict[str,Offer] = {}
    accepted_offer: Offer

    offers: list[str] = []

    status: TripStatusEnum = TripStatusEnum.open

class WithdrawInput(BaseModel):
    action: str = "withdraw"
    amount: int


class TripRequestInput(BaseModel):
    action: str = "trip_request"
    geohash_origin: str
    geohash_destination: str
    trip_commitment: str
    estimated_distance: str
    timeout: int

class TripOfferInput(BaseModel):
    action: str = "trip_offer"
    geohash: str

class TripsManager:
    def __init__(self):
        self.trips: dict[str, Trip] = {}
        self.origin_geohash_trie = StringTrie()
        self.drivers_trip: dict[str, str] = {}
        self.drivers_offer: dict[str, str] = {}
        self.riders_trip: dict[str, str] = {}

    def create(self, requestor: str, timestamp: int, input_params: TripRequestInput):
        # self.origin_geohash_trie[geohash_origin] = trip_id
        # TODO: check if user is on another trip
        # TODO: check if user has enough balance
        # TODO: check if trip makes sense (compare geohashes distance to actual distance)

        timeout = input_params.timeout
        if timeout is None or timeout == 0:
            timeout = settings.default_timeout

        new_trip = Trip(
            id = str(uuid.uuid4()),
            rider = requestor,
            timestamp = timestamp,
            timeout = timeout,

            geohash_origin = input_params.geohash_origin,
            geohash_destination = input_params.geohash_destination,
            trip_commitment = input_params.trip_commitment,
            estimated_value = input_params.estimated_value
        )

        self.trips[new_trip.id] = new_trip
        self.origin_geohash_trie[new_trip.geohash_origin] = new_trip.id
        self.riders_trip[requestor] = new_trip.id

    def match_trips(self, geohash: str):
        trips = self.origin_geohash_trie.values(geohash)
        trip_list = [] 
        for tid in trips:
            trip = self.trips[tid]
            trip_list.append({"trip_id":tid,"timestamp":timestamp,"timeout":timeout,
                "geohash_origin":trip.geohash_origin,"geohash_destination":trip.geohash_destination,
                "estimated_distance":estimated_distance,"estimated_value":estimated_distance*settings.distance_price})
        return trip_list

    def get(self, trip_id: str) -> Trip:
        return self.trips[trip_id]

    def remove(self, trip_id: str):
        del self.trips[trip_id]

    def add_offer(self, trip_id:str, driver:str, timestamp: int, input_params: TripOfferInput):
        # TODO: check parameters
        # TODO: check trip status (still accepts offers at this point)
        # TODO: check if trip timeout
        # TODO: check if driver has another offer for this trip
        # TODO: check if driver can offer (compare geohash distance)
        if self.trips[trip_id] is None:
            raise "invalid trip"
        trip = self.trips[trip_id]
        if trip.status != TripStatusEnum.open:
            raise "invalid status"

        new_offer = Offer(
            driver_address = driver,
            timestamp = timestamp,
            driver_geohash = input_params['distance'],
            distance = input_params['distance'],
            eta = input_params['eta']
        )
        trip.offers[driver] = new_offer
        self.drivers_offer[driver] = trip_id
    
    def accept_offer(self, trip_id:str, driver: str, timestamp: int):
        if self.trips[trip_id] is None:
            raise "invalid trip"
        trip = self.trips[trip_id]
        if trip.status != TripStatusEnum.open:
            raise "invalid status"
        if trip.offers[driver] is None:
            raise "invalid offer"

        trip.accept_offer = trip.offers[driver]
        trip.offers = {}
        trip.status = TripStatusEnum.in_progress

        del self.drivers_offers[driver]
        self.drivers_trip[driver] = trip_id

    def end_trip(self, trip_id:str, addr: str, timestamp: int):
        # TODO: detect suspicious trips (use trip to transfer money) 
        if self.trips[trip_id] is None:
            raise "invalid trip"
        trip = self.trips[trip_id]

        if trip.accept_offer is None:
            raise "invalid offer"


    # TODO: End trip, wait confimation, dispute end

    # TODO: allow cancel trip and trip give up 

    # TODO: clean old trip requests


class Bank:
    def __init__(self):
        self.wallets: dict[str, Wallet] = {}

    def _get_wallet(self, address: str) -> Wallet:
        addr = address.lower()
        wallet = self.wallets.get(addr)
        if wallet is None:
            new_wallet = Wallet(
                owner = addr
            )
            wallet = new_wallet
        return wallet
    
    def deposit(self, address: str, amount: int):
        if amount <= 0:
            raise "invalid amount"
        wallet = _get_wallet(address)
        wallet.balance += amount

    def withdraw(self, address: str, amount: int):
        if amount <= 0:
            raise "invalid amount"
        wallet = _get_wallet(address)
        if wallet.balance < amount:
            raise "insuficient funds"
        wallet.balance -= amount
        
    def transfer(self, sender: str, receiver: str, amount: int):
        if amount <= 0:
            raise "invalid amount"
        self.withdraw(sender,amount)
        self.deposit(receiver,amount)

    def balance(self, address: str) -> int:
        wallet = _get_wallet(address)
        return wallet.balance

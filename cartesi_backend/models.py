from pydantic import BaseModel
from typing import Optional
from enum import Enum
from pytrie import StringTrie 
import uuid
from settings import Settings
from pygeodesy import geohash

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
    driver_n_trips: int
    driver_reputation: int
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
    start_timestamp: Optional[int]
    end_timestamp: Optional[int]
    confirmation_timestamp: Optional[int]
    rider: str

    geohash_origin: str
    geohash_destination: str
    trip_commitment: str
    distance: int
    timeout: int

    offers: dict[str,Offer] = {}
    accepted_offer: Optional[Offer] = None

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
    distance: int
    timeout: int

class TripOfferInput(BaseModel):
    action: str = "trip_offer"
    trip_id: str
    geohash: str

class AcceptOfferInput(BaseModel):
    action: str = "accept_offer"
    trip_id: str
    driver_address: str

class RidersManager:
    def __init__(self):
        self.riders: dict[str, Rider] = {}

    def get(self, address: str) -> Rider:
        addr = address.lower()
        rider = self.riders.get(addr)
        if rider is None:
            new_rider = Rider(
                address = addr
            )
            rider = new_rider
        return rider

class DriversManager:
    def __init__(self):
        self.drivers: dict[str, Driver] = {}
        self.security_deposits_registers: dict[str, int] = {}

    def get(self, address: str) -> Driver:
        addr = address.lower()
        driver = self.drivers.get(addr)
        return driver

    def create(self, address: str) -> Driver:
        addr = address.lower()
        driver = self.drivers.get(addr)
        if driver is not None:
            raise Exception("Already a driver")
        deposit = self.security_deposits_registers.get(addr)
        if deposit is None or deposit < settings.security_deposit_value:
            raise Exception("Invalid deposit")
        new_driver = Driver(
            address = addr
        )
        driver = new_driver
        return driver

    def register_deposit(self, address: str, amount: int) -> int:
        addr = address.lower()
        if self.security_deposits_registers.get(addr) is None:
            self.security_deposits_registers[addr] = 0
        self.security_deposits_registers[addr] += amount
        return self.security_deposits_registers[addr]

    def register_withdraw(self, address: str) -> int:
        deposit = self.security_deposits_registers.get(addr)
        if deposit is None:
            return 0
        del self.security_deposits_registers[addr]
        return deposit

class TripsManager:
    def __init__(self):
        self.trips: dict[str, Trip] = {}
        self.origin_geohash_trie = StringTrie()
        self.drivers_trip: dict[str, str] = {}
        self.drivers_offer: dict[str, str] = {}
        self.riders_trip: dict[str, str] = {}

    def create(self, timestamp: int, rider: Rider, input_params: TripRequestInput):
        # TODO: check parameters
        trip_id = self.riders_trip.get(rider.address)
        if trip_id is not None:
            raise Exception("Rider has other active trip")
        # TODO: check if trip makes sense (compare geohashes distance to actual distance)

        timeout = input_params.timeout
        if timeout is None or timeout == 0:
            timeout = settings.default_timeout

        new_trip = Trip(
            id = str(uuid.uuid4()),
            rider = rider.address.lower(),
            request_timestamp = timestamp,
            timeout = timestamp+timeout,

            geohash_origin = input_params.geohash_origin,
            geohash_destination = input_params.geohash_destination,
            trip_commitment = input_params.trip_commitment,
            distance = input_params.distance,
            estimated_value = input_params.distance*settings.distance_price
        )

        self.trips[new_trip.id] = new_trip
        self.origin_geohash_trie[new_trip.geohash_origin] = new_trip.id
        self.riders_trip[rider.address] = new_trip.id

    def match_trips(self, geohash: str):
        trips = self.origin_geohash_trie.values(geohash)
        trip_list = [] 
        for tid in trips:
            trip = self.trips[tid]
            trip_list.append({"trip_id":tid,"timestamp":trip.request_timestamp,"timeout":trip.timeout,
                "geohash_origin":trip.geohash_origin,"geohash_destination":trip.geohash_destination,
                "distance":trip.distance,"estimated_value":trip.distance*settings.distance_price})
        return trip_list

    def get(self, trip_id: str) -> Trip:
        return self.trips[trip_id]

    def remove(self, trip_id: str):
        del self.trips[trip_id]

    def add_offer(self, timestamp: int, driver: Driver, input_params: TripOfferInput):
        # TODO: check parameters
        # TODO: check trip status (still accepts offers at this point)
        # TODO: check if trip timeout
        # TODO: check if driver has another offer/trip. 
        #        Check trips timeout or one sided ending
        if self.drivers_offer.get(driver.address) is not None:
            raise Exception("Driver has another active offer")
        if self.drivers_trip.get(driver.address) is not None:
            raise Exception("Driver has another active trip")
        # TODO: check if driver can offer (compare geohash distance)

        trip_id = input_params.trip_id

        trip = self.trips.get(trip_id)
        if trip is None:
            raise Exception("invalid trip")
        trip = self.trips[trip_id]
        if trip.status != TripStatusEnum.open:
            raise Exception("invalid status")
        
        distance = geohash.distance_(input_params.geohash,trip.geohash_origin) # use osrm to get route and calculate better approximation
        eta = timestamp # use osrm to get route and calculate an eta

        new_offer = Offer(
            driver_address = driver.address.lower(),
            driver_n_trips = driver.n_trips,
            driver_reputation = driver.reputation,
            timestamp = timestamp,
            driver_geohash = input_params['geohash'],
            distance = distance,
            eta = eta
        )
        trip.offers[driver] = new_offer
        self.drivers_offer[driver] = trip_id
    
    def accept_offer(self, timestamp: int, rider: Rider, input_params: AcceptOfferInput):
        trip = self.trips.get(input_params.trip_id)
        if trip is None:
            raise Exception("invalid trip")
        if trip.rider != rider.address:
            raise Exception("invalid rider")
        if trip.status != TripStatusEnum.open:
            raise Exception("invalid status")
        offer = trip.offers.get(input_params.driver_address)
        if offer is None:
            raise Exception("invalid offer")

        for o in trip.offers:
            del self.drivers_offer[trip.offers[o].driver_address]
        self.drivers_trip[driver] = trip_id

        trip.accepted_offer = offer
        trip.offers.clear()
        trip.status = TripStatusEnum.in_progress

    def cancel_offer(self, addr: str):
        trip_id = self.riders_trip.get(addr)
        if trip_id is None:
            raise Exception("Rider has no active trip")
        trip = self.trips.get(trip_id)
        if trip is None:
            raise Exception("invalid trip")
        
        del trip.offers[addr]
        del self.drivers_offer[addr]

    def cancel_trip_request(self, addr: str):
        trip_id = self.drivers_offer.get(addr)
        if trip_id is None:
            raise Exception("Driver has no offers")
        trip = self.trips.get(trip_id)
        if trip is None:
            raise Exception("invalid trip")
        
        del trip.offers[addr]
        del self.drivers_offer[addr]

    def cancel_trip(self, addr: str):
        # TODO: cancel trip after accept offer
        pass

    def get(self, trip_id: str) -> Trip:
        return self.trips.get(trip_id)

    def get_trip_by_driver_offer(self, address: str) -> Trip:
        addr = address.lower()
        trip_id = self.drivers_offer.get(addr)
        return self.trips.get(trip_id)

    def get_trip_by_driver(self, address: str) -> Trip:
        addr = address.lower()
        trip_id = self.drivers_trip.get(addr)
        return self.trips.get(trip_id)

    def get_trip_by_rider(self, address: str) -> Trip:
        addr = address.lower()
        trip_id = self.riders_trip.get(addr)
        return self.trips.get(trip_id)

    def end_trip(self, trip_id:str, addr: str, timestamp: int):
        # TODO: detect suspicious trips (use trip to transfer money)
        #   trip doen't match predictions
        if self.trips[trip_id] is None:
            raise Exception("invalid trip")
        trip = self.trips[trip_id]

        if trip.accept_offer is None:
            raise Exception("invalid offer")

        # TODO: rest of trip end
        #   delete all objects

    def has_enough_balance(self, input_params: TripOfferInput, balance: int) -> bool:
        estimated_value = input_params.distance*settings.distance_price
        return balance >= estimated_value*settings.trip_request_min_balance

    # TODO: End trip, wait confimation, dispute end

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
            self.wallets[addr] = new_wallet
            wallet = new_wallet
        return wallet
    
    def deposit(self, address: str, amount: int):
        if amount <= 0:
            raise Exception("invalid amount")
        wallet = self._get_wallet(address)
        wallet.balance += amount

    def withdraw(self, address: str, amount: int):
        if amount <= 0:
            raise Exception("invalid amount")
        wallet = self._get_wallet(address)
        if wallet.balance < amount:
            raise Exception("insuficient funds")
        wallet.balance -= amount
        
    def transfer(self, sender: str, receiver: str, amount: int):
        if amount <= 0:
            raise Exception("invalid amount")
        self.withdraw(sender,amount)
        self.deposit(receiver,amount)

    def balance(self, address: str) -> int:
        wallet = self._get_wallet(address)
        return wallet.balance

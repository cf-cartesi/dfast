from pydantic import BaseModel
from typing import NamedTuple
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
    n_trips: int = 0

    def update_n_trips(self):
        self.n_trips += 1

class Driver(BaseModel):
    address: str
    n_trips: int = 0
    reputation: int = 6000 # max 10k
    # total_inInsurance_payed: int = 0

    def update_reputation(self, score: int) -> int:
        if score < 0 or score > settings.max_reputation:
            raise Exception("Invalid score")
        nt = self.n_trips
        if nt > settings.max_n_trips_reputation: nt = settings.max_n_trips_reputation
        if nt < 1: nt = 1
        new_reputation = (nt * self.reputation + score) // (nt+1)
        if new_reputation > settings.max_reputation: new_reputation = settings.max_reputation
        self.reputation = new_reputation
        self.n_trips += 1
        return new_reputation


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
    canceled = 'canceled'
    timeout = 'timeout'
    ended = 'ended'
    quarantine = 'quarantine'
    dispute = 'dispute'

class EndClaim(NamedTuple):
    timestamp: int
    final_distance: int
    start_timestamp: int
    end_timestamp: int
    score: int

class Trip(BaseModel):
    id: str
    request_timestamp: int
    start_timestamp: Optional[int]
    end_timestamp: Optional[int]
    confirmation_timestamp: Optional[int]
    quarantine_timestamp: Optional[int]
    quarantine_timeout: Optional[int]
    dispute_timestamp: Optional[int]
    finish_timestamp: Optional[int]
    rider: str
    locked_assets: int

    geohash_origin: str
    geohash_destination: str
    trip_commitment: str
    distance: int
    timeout: int

    offers: dict[str,Offer] = {}
    accepted_offer: Optional[Offer] = None

    end_claims: dict[str,EndClaim] = {}
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
    driver: str

class TimeoutRequestInput(BaseModel):
    action: str = "timeout_request"
    trip_id: str

class FinishTripInput(BaseModel):
    action: str = "finish_trip"
    trip_id: str
    # rider signature over the local state: distance to destination
    peer_signature: Optional[str]
    trip_score_rider: Optional[int]
    final_distance: int
    start_timestamp: int
    end_timestamp: int
    # reputation_commitment: str
    # reputation_proof: str

class FinishTripDisputeInput(BaseModel):
    action: str = "finish_trip_dispute"
    trip_id: str
    score: int
    final_distance: int
    start_timestamp: int
    end_timestamp: int

class TimeoutTripInput(BaseModel):
    action: str = "timeout_trip"
    trip_id: str

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
            self.riders[new_rider.address] = new_rider
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
        if self.drivers.get(addr) is not None:
            raise Exception("Already a driver")
        deposit = self.security_deposits_registers.get(addr)
        if deposit is None or deposit < settings.security_deposit_value:
            raise Exception("Invalid deposit")
        new_driver = Driver(
            address = addr
        )
        self.drivers[new_driver.address] = new_driver
        return new_driver

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

    def update_reputation(self, address: str, score: int) -> int:
        addr = address.lower()
        driver = self.drivers.get(addr)
        if driver is None:
            raise Exception("Invalid driver")
        if score < 0 or score > settings.max_reputation:
            raise Exception("Invalid score")
        new_rep = update_reputation(driver.reputation,driver.driver_n_trips,score)
        driver_reputation = new_reputation
        driver.n_trips += 1
        

class TripsManager:
    def __init__(self):
        self.trips: dict[str, Trip] = {}
        self.origin_geohash_trie = StringTrie()
        self.drivers_trip: dict[str, str] = {}
        self.drivers_offer: dict[str, str] = {}
        self.riders_trip: dict[str, str] = {}
        self.trips_in_quarantine: dict[str, Trip] = {}
        self.quarantined_users: dict[str, str] = {}
        self.trips_in_dispute: dict[str, Trip] = {}

    def create(self, timestamp: int, rider: Rider, locked_amount: int, input_params: TripRequestInput):
        # TODO: check parameters
        trip_id = self.riders_trip.get(rider.address)
        if trip_id is not None:
            raise Exception("Rider has other active trip")
        if self.drivers_offer.get(rider.address) is not None:
            raise Exception("Rider has an active offer")
        if self.drivers_trip.get(rider.address) is not None:
            raise Exception("Rider has another active trip as driver")
        if self.quarantined_users.get(rider.address) is not None:
            raise Exception("Rider is quarantined")
        # TODO: check if trip makes sense (compare geohashes distance to actual distance)

        timeout = input_params.timeout
        if timeout is None or timeout == 0:
            timeout = settings.default_timeout

        new_trip = Trip(
            id = str(uuid.uuid4()),
            rider = rider.address.lower(),
            request_timestamp = timestamp,
            timeout = timestamp+timeout,
            locked_assets = locked_amount,

            geohash_origin = input_params.geohash_origin,
            geohash_destination = input_params.geohash_destination,
            trip_commitment = input_params.trip_commitment,
            distance = input_params.distance,
            estimated_value = input_params.distance*settings.distance_price
        )

        self.trips[new_trip.id] = new_trip
        self.origin_geohash_trie[new_trip.geohash_origin] = new_trip.id
        self.riders_trip[rider.address] = new_trip.id

    def match_trips(self, geohash: str, ts: int):
        trips = self.origin_geohash_trie.values(geohash)
        trip_list = [] 
        for tid in trips:
            trip = self.trips[tid]
            if ts or ts < trip.timeout:
                trip_list.append({"trip_id":tid,"timestamp":trip.request_timestamp,"timeout":trip.timeout,
                    "geohash_origin":trip.geohash_origin,"geohash_destination":trip.geohash_destination,
                    "distance":trip.distance,"estimated_value":trip.distance*settings.distance_price})
        return trip_list

    def remove(self, trip_id: str):
        if self.trips.get(trip_id) is None:
            raise Exception("invalid trip")
        del self.trips[trip_id]

    def add_offer(self, timestamp: int, driver: Driver, input_params: TripOfferInput):
        # TODO: check parameters
        # TODO: check trip status (still accepts offers at this point)
        # TODO: check if driver has another offer/trip. 
        #        Check trips timeout or one sided ending
        if self.riders_trip.get(driver.address) is not None:
            raise Exception("Driver has other and active trip as rider")
        if self.drivers_offer.get(driver.address) is not None:
            raise Exception("Driver has another active offer")
        if self.drivers_trip.get(driver.address) is not None:
            raise Exception("Driver has another active trip")
        if self.quarantined_users.get(driver.address) is not None:
            raise Exception("Driver is quarantined")
        # TODO: check if driver can offer (compare geohash distance)

        trip_id = input_params.trip_id

        trip = self.trips.get(trip_id)
        if trip is None:
            raise Exception("invalid trip")
        trip = self.trips[trip_id]
        if trip.status != TripStatusEnum.open:
            raise Exception("invalid status")
        
        # check if trip timeout
        if timestamp > trip.timeout:
            raise Exception("Timeout expired")

        distance = geohash.distance_(input_params.geohash,trip.geohash_origin) # use osrm to get route and calculate better approximation
        eta = timestamp # use osrm to get route and calculate an eta

        new_offer = Offer(
            driver_address = driver.address,
            driver_n_trips = driver.n_trips,
            driver_reputation = driver.reputation,
            timestamp = timestamp,
            driver_geohash = input_params.geohash,
            distance = distance,
            eta = eta
        )
        trip.offers[driver.address] = new_offer
        self.drivers_offer[driver.address] = trip_id
    
    def accept_offer(self, timestamp: int, rider: Rider, input_params: AcceptOfferInput):
        trip_id = self.riders_trip.get(rider.address)
        if trip_id is None:
            raise Exception("Rider has no active trip")
        trip = self.trips.get(trip_id)
        if trip is None:
            raise Exception("invalid trip")
        if trip.rider != rider.address:
            raise Exception("invalid rider")
        if trip.status != TripStatusEnum.open:
            raise Exception("invalid status")
        driver = input_params.driver.lower()
        offer = trip.offers.get(driver)
        if offer is None:
            raise Exception("invalid offer")

        trip.accepted_offer = offer
        trip.confirmation_timestamp = timestamp
        trip.status = TripStatusEnum.in_progress
        self.drivers_trip[driver] = trip_id

        for o in trip.offers:
            del self.drivers_offer[trip.offers[o].driver_address]
        trip.offers.clear()

    def cancel_offer(self, addr: str):
        trip_id = self.drivers_offer.get(addr)
        if trip_id is None:
            raise Exception("Driver has no offers")
        trip = self.trips.get(trip_id)
        if trip is None:
            raise Exception("invalid trip")
        
        del trip.offers[addr]
        del self.drivers_offer[addr]

    def cancel_trip_request(self, addr: str):
        trip_id = self.riders_trip.get(addr)
        if trip_id is None:
            raise Exception("Rider has no active trip")
        trip = self.trips.get(trip_id)
        if trip is None:
            raise Exception("invalid trip")
        
        trip.status = TripStatusEnum.canceled
        for o in trip.offers:
            del self.drivers_offer[trip.offers[o].driver_address]
        trip.offers.clear()
        del self.riders_trip[trip.rider]
        del self.trips[trip_id]

    def timeout_request(self, timestamp: int, trip_id: str):
        trip = self.trips.get(trip_id)
        if trip is None:
            raise Exception("invalid trip")
        trip = self.trips[trip_id]
        if trip.status != TripStatusEnum.open:
            raise Exception("invalid status")
        
        # check if trip timeout
        if timestamp <= trip.timeout:
            raise Exception("Timeout not expired yet")

        trip.status = TripStatusEnum.timeout
        for o in trip.offers:
            del self.drivers_offer[trip.offers[o].driver_address]
        trip.offers.clear()
        del self.riders_trip[trip.rider]
        del self.trips[trip_id]
        
    def check_timeout_trip(self, timestamp: int, trip_id: str):
        trip = self.trips_in_quarantine.get(trip_id)
        if trip is None:
            raise Exception("invalid trip")
        trip = self.trips[trip_id]
        if trip.status != TripStatusEnum.quarantine:
            raise Exception("invalid status")
        
        # check if trip timeout
        if timestamp <= trip.quarantine_timeout:
            # Timeout not expired yet
            return False
        return True

    def add_end_claim(self, trip_id: str, addr: str, timestamp: int, 
            final_distance: int, start_timestamp: int, end_timestamp: int, score: int):

        trip = self.trips_in_quarantine.get(trip_id)
        if trip is None:
            raise Exception("invalid trip")
        if trip.status != TripStatusEnum.quarantine:
            raise Exception("invalid status")

        end_claim = EndClaim(timestamp, final_distance, start_timestamp, end_timestamp, score)
        trip.end_claims[addr.lower()] = end_claim

    def quarantine_trip(self, trip_id: str, timestamp: int):
        trip = self.trips.get(trip_id)
        if trip is None:
            raise Exception("invalid trip")
        
        trip.status = TripStatusEnum.quarantine
        trip.quarantine_timestamp = timestamp
        trip.quarantine_timeout = timestamp + settings.quarantine_timeout
        self.trips_in_quarantine[trip_id] = trip

        del self.riders_trip[trip.rider]
        del self.drivers_trip[trip.accepted_offer.driver_address]
        del self.trips[trip_id]

    def dispute_trip(self, trip_id: str, timestamp: int):
        trip = self.trips_in_quarantine.get(trip_id)
        if trip is None:
            raise Exception("invalid trip")
        if trip.status != TripStatusEnum.quarantine:
            raise Exception("invalid status")
        
        trip.status = TripStatusEnum.dispute
        trip.dispute_timestamp = timestamp
        trip.quarantine_timeout = timestamp + settings.quarantine_timeout
        self.trips_in_dispute[trip_id] = trip

        del self.trips_in_quarantine[trip_id]
        if self.quarantined_users.get(trip.rider): del self.quarantined_users[trip.rider]
        if self.quarantined_users.get(trip.accepted_offer.driver_address): del self.quarantined_users[trip.accepted_offer.driver_address]

    def end_trip(self, trip: Trip, timestamp: int, start_timestamp: int, end_timestamp: int):
        # TODO: detect suspicious trips (use trip to transfer money)
        #   trip doen't match predictions

        trip.locked_assets = 0
        trip.status = TripStatusEnum.ended
        trip.finish_timestamp = timestamp
        trip.start_timestamp = start_timestamp
        trip.end_timestamp = end_timestamp

        if self.riders_trip.get(trip.rider): del self.riders_trip[trip.rider]
        if self.drivers_trip.get(trip.accepted_offer.driver_address): del self.drivers_trip[trip.accepted_offer.driver_address]
        if self.quarantined_users.get(trip.rider): del self.quarantined_users[trip.rider]
        if self.quarantined_users.get(trip.accepted_offer.driver_address): del self.quarantined_users[trip.accepted_offer.driver_address]
        if self.trips.get(trip.id): del self.trips[trip.id]
        if self.trips_in_quarantine.get(trip.id): del self.trips_in_quarantine[trip.id]
        if self.trips_in_dispute.get(trip.id): del self.trips_in_dispute[trip.id]

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

    def get_quarantine(self, trip_id: str) -> Trip:
        return self.trips_in_quarantine.get(trip_id)

    def get_trip_by_quarantined(self, address: str) -> Trip:
        addr = address.lower()
        trip_id = self.quarantined_users.get(addr)
        return self.trips_in_quarantine.get(trip_id)

    def get_dispute(self, trip_id: str) -> Trip:
        return self.trips_in_dispute.get(trip_id)

    def get_overshooted_trip_value(self,distance: int) -> int:
        value = distance*settings.distance_price
        return value*settings.overshooted_trip_value_mult

    def get_final_trip_value(self,distance: int, duration: int, locked_amount: int) -> int:
        dist_value = distance*settings.distance_price
        time_value = duration*settings.time_price
        final_value = max(dist_value,time_value)
        final_value = min(final_value,locked_amount)
        return final_value

    def get_insurance_value(self,value: int, reputation: int) -> int:
        return value * settings.min_insurance_pecentage // 100 + \
            value * (settings.max_reputation - reputation) // settings.max_reputation * \
            (settings.max_insurance_pecentage - settings.min_insurance_pecentage) // 100

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

from pydantic import BaseModel

class Settings(BaseModel):
    # Errc20 token Price
    accepted_erc20_token: str = '0xc6e7DF5E7b4f2A278906862b61205850344D4e7d'
    distance_price: int = 1_000_000_000_000_000 # 1e18 / km
    time_price: int = 8_333_000_000_000_000 # per s -> ~5e17 / min
    default_timeout: int = 600
    quarantine_timeout: int = 86400
    overshooted_trip_value_mult: int = 3
    max_reputation = 10000
    max_n_trips_reputation = 99
    security_deposit_value: int = 1_000_000_000_000_000_000_000
    security_deposits_address: str = "0x0000000000000000000000000000000000000000"
    # locked assets address Dao contract
    locked_assets_address: str = "0x0000000000000000000000000000000000000001"
    max_insurance_pecentage = 20
    min_insurance_pecentage = 2
    # insurance Dao contract
    insurance_address: str = "0x0000000000000000000000000000000000000002"
    security_deposit_min_n_trip: int = 100
    # dispute Dao contract
    dispute_address: str = "0x0000000000000000000000000000000000000003"

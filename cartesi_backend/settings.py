from pydantic import BaseModel

class Settings(BaseModel):
    # Errc20 token Price
    accepted_erc20_token: str = '0xc6e7DF5E7b4f2A278906862b61205850344D4e7d'
    distance_price: int = 1_000_000_000_000_000 # 1e18 / km
    time_price: int = 8_333_000_000_000_000 # ~5e17 / min
    default_timeout: int = 600
    trip_request_min_balance: int = 3
    security_deposit_value: int = 1_000_000_000_000_000_000_000
    security_deposits_address: str = "0x0000000000000000000000000000000000000000"
    security_deposit_min_n_trip: int = 100

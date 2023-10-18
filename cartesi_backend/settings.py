from pydantic import BaseModel

class Settings(BaseModel):
    # Errc20 token Price
    accepted_erc20_token: str = '0xc6e7DF5E7b4f2A278906862b61205850344D4e7d'
    distance_price: int = 1_000_000_000_000_000
    default_timeout: int = 600

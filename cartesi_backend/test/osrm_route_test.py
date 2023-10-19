import requests

ORIGIN = "-43.207597,-22.917212"
DESTINATION = "-43.188697,-22.951274"
ENABLE_STEPS = "true"
osrm_url = f"http://127.0.0.1:5000/route/v1/driving/{ORIGIN};{DESTINATION}?steps={ENABLE_STEPS}"
response = requests.get(osrm_url)
print (response.json())

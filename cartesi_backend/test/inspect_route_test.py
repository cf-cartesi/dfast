import requests
import json

#Test origin and destination coordinates
ORIGIN = "-43.207597,-22.917212"
DESTINATION = "-43.188697,-22.951274"

#URL with parameters for cartesi node inspect call on route
osrm_url = f"http://127.0.0.1:8080/inspect/route/{ORIGIN};{DESTINATION}"
print (f"Making request to {osrm_url}")

#Making request to Cartesi inspect endpoint
response = requests.get(osrm_url)

#Decoding response
json_data = response.content.decode('utf-8')

#Parsing as json
json_object = json.loads(json_data)

#Decoding the report payload as json
json_object["reports"][0]["payload"] = json.loads(bytes.fromhex(json_object["reports"][0]["payload"][2:]).decode('utf-8'))

#Dumping json with identation
json_formatted_str = json.dumps(json_object, indent=2)

#Printing
print ("Response:")
print (json_formatted_str)

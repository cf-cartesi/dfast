echo "Trying to connect to OSRM"
until python3 osrm_route_test.py
do 
	echo "Failed, waiting 5s"
	sleep 5
	echo "Trying to connect to OSRM"
done

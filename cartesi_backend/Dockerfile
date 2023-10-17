# syntax=docker.io/docker/dockerfile:1.4
FROM --platform=linux/riscv64 cartesi/python:3.10-slim-jammy

LABEL io.sunodo.sdk_version=0.2.0
LABEL io.cartesi.rollups.ram_size=128Mi
# LABEL io.cartesi.rollups.ram_size=8Gi
# LABEL io.cartesi.rollups.disk_size=50Gi

ARG MACHINE_EMULATOR_TOOLS_VERSION=0.12.0
RUN <<EOF
apt-get update
# apt-get install -y --no-install-recommends busybox-static=1:1.30.1-7ubuntu3 ca-certificates=20230311ubuntu0.22.04.1 curl=7.81.0-1ubuntu1.14 build-essential git cmake pkg-config libbz2-dev libxml2-dev libzip-dev libboost-all-dev lua5.2 liblua5.2-dev libtbb-dev
apt-get install -y --no-install-recommends busybox-static=1:1.30.1-7ubuntu3 ca-certificates=20230311ubuntu0.22.04.1 curl=7.81.0-1ubuntu1.14 git
curl -fsSL https://github.com/cartesi/machine-emulator-tools/releases/download/v${MACHINE_EMULATOR_TOOLS_VERSION}/machine-emulator-tools-v${MACHINE_EMULATOR_TOOLS_VERSION}.tar.gz \
  | tar -C / --overwrite -xvzf -
rm -rf /var/lib/apt/lists/*
EOF

# WORKDIR /opt
# RUN git clone  --branch v5.27.1 https://github.com/Project-OSRM/osrm-backend.git

# WORKDIR /opt/osrm-backend
# RUN mkdir -p build

# WORKDIR /opt/osrm-backend/build

# RUN cmake ..
# RUN cmake --build . -j 10
# RUN cmake --build . --target install
# RUN apt update
# RUN apt install -y --no-install-recommends wget
# RUN wget https://download.geofabrik.de/south-america/brazil/sudeste-latest.osm.pbf
# RUN ls ../profiles
# RUN osrm-extract -p ../profiles/car.lua sudeste-latest.osm.pbf
# RUN osrm-partition sudeste-latest.osrm
# RUN osrm-customize sudeste-latest.osrm

ENV PATH="/opt/cartesi/bin:${PATH}"

WORKDIR /opt/cartesi/dapp
COPY ./requirements.txt .

RUN <<EOF
pip install -r requirements.txt --no-cache
find /usr/local/lib -type d -name __pycache__ -exec rm -r {} +
EOF

COPY ./dapp.py .

ENV ROLLUP_HTTP_SERVER_URL="http://127.0.0.1:5004"

ENTRYPOINT ["rollup-init"]
CMD ["python3", "dapp.py"]

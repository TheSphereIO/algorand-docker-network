ARG ALGO_VERSION=3.11.3
FROM algorand/stable:$ALGO_VERSION

# When these are set attempt to connect to a network.
ARG GENESIS_FILE=""
ARG BOOTSTRAP_URL=""

# Options for algod config
ARG ALGOD_PORT=""
ARG KMD_PORT=""
ARG TOKEN=""
ARG TEMPLATE=""
ARG NETWORK_NUM_ROUNDS="30000"
ARG NODE_ARCHIVAL=""

# Basic dependencies.
ENV ENTRY /root
ENV BIN_DIR="${ENTRY}/node"
#ENV ALGORAND_DATA="${ENTRY}/data"
RUN apt-get update && apt-get install -y apt-utils  bsdmainutils python3
# Copy lots of things into the container. The gitignore indicates which directories.
COPY . /tmp
WORKDIR $ENTRY
RUN mkdir -p "${ENTRY}/testnetwork/Node" && chown -R root "${ENTRY}/testnetwork"
#ENV PYTHONUNBUFFERED=true
# Configure network

RUN sed -i "s/NETWORK_NUM_ROUNDS/$NETWORK_NUM_ROUNDS/" "/tmp/${TEMPLATE}"
RUN python3 -u /tmp/images/algod/setup.py \
 --bin-dir "$BIN_DIR" \
 --data-dir "${ENTRY}/data" \
 --start-script "${ENTRY}/start_algod.sh" \
 --network-dir "${ENTRY}/testnetwork" \
 --network-template "/tmp/${TEMPLATE}" \
 --network-token "${TOKEN}" \
 --algod-port "${ALGOD_PORT}" \
 --kmd-port "${KMD_PORT}" \
 --bootstrap-url "${BOOTSTRAP_URL}" \
 --genesis-file "/tmp/${GENESIS_FILE}" \
 --archival "${NODE_ARCHIVAL}"
#
#ENV PATH="$BIN_DIR:${PATH}"
VOLUME /root/testnetwork

#
## Start algod
CMD ["/root/start_algod.sh"]

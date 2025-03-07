# algorand-docker-network

This repository contains two Bash scripts for creating an Algorand private network of any size and a Python script for creating a Docker Compose file used to deploy the private network on the host machine. Each node of the network runs in a separate container. The private network is composed of n participants nodes and one relay node. All participant nodes connect to the relay node to communicate with the network, i.e. it is a star network topology.


### How to create a network:

```
sh createNetwork.sh 4
```
This will create a folder named 4-nodes-net/ with 4 participants and 1 relay node. The common genesis file distributes an even amount of stake to each participant (A participant has one account). The relay node does not participate in the consensus protocol.

### Deploy the network:

```
cd 4-nodes-net/ && docker-compose up
```

This will run each node in a Docker container using the YAML file generated by the dockerYamlGenerator.py script.

#!/usr/bin/env bash

NIC_NAME="bond0"
DOCKER_ROUTING_INTERFACE_NAME="dockerrouteif"
DOCKERNETWORK_IP_ADDRESS="192.168.0.29/32"
DOCKERNODE_IP_ADDRESS="192.168.0.20/32"

sleep 15 #Do not rush things if executing during boot.

ip link add ${DOCKER_ROUTING_INTERFACE_NAME} link ${NIC_NAME}type macvlan mode bridge ;
ip addr add ${DOCKERNETWORK_IP_ADDRESS} dev ${DOCKER_ROUTING_INTERFACE_NAME} 
ip link set ${DOCKER_ROUTING_INTERFACE_NAME} up
ip route add ${DOCKERNODE_IP_ADDRESS} dev ${DOCKER_ROUTING_INTERFACE_NAME}
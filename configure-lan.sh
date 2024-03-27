#!/usr/bin/env bash

# This script sets up the Jetson's ethernet interface to connect to Spot's ethernet network using NetworkManager.
# NetworkManager will persist the changes made by this script

# Change if NetworkManager has assigned the Ethernet interface a different name
network_name="Wired connection 1"

nmcli con down "$network_name"
nmcli con mod "$network_name" ipv4.addresses "192.168.50.6/24"
nmcli con mod "$network_name" ipv4.gateway "192.168.50.3"
nmcli con mod "$network_name" ipv4.method manual
nmcli con mod "$network_name" connection.autoconnect yes
nmcli con up "$network_name"

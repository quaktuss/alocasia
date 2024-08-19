#!/bin/bash

sudo apt update
sudo apt upgrade -y

echo "Created by dhole on $(date +%d) $(date +%A) at $(date +%T)"

sudo shutdown -P +180

#!/bin/bash

sudo apt update
sudo apt upgrade -y

echo "Created by dhole on $(date +%d) $(date +%A) at $(date +%T)" >> dhole.txt

## Install SSM Agent
sudo snap install amazon-ssm-agent --classic
sudo snap start amazon-ssm-agent

sudo shutdown -P +180



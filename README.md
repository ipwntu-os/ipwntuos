#!/bin/bash

# iPwntU OS AntiSnoop Eddition

# Update and install dependencies

apt-get update
apt-get install git live-build cdebootstrap devscripts -y

# Clone the live-build config

git clone https://github.com/ipwntuos/ipwntuos.git

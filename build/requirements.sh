#!/bin/bash

sudo apt-get update && \
sudo apt install -y graphviz && \
sudo apt-get -y install wget && \
sudo apt-get install -y git && \
sudo apt-get install -y build-essential && \
sudo apt-get install -y libmagic-dev && \
sudo DEBIAN_FRONTEND=noninteractive apt install -y imagemagick && \
sudo rm -rf /var/lib/apt/lists/*

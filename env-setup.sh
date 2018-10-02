#!/bin/bash

sudo apt-get install gcc
echo "Installing using requirement file: $1"
conda update pip
while read requirement; do conda install --yes $requirement || pip install $requirement; done < $1

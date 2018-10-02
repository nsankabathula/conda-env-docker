#!/bin/bash

echo "Installing using requirement file: $1"
pip install --upgrade pip
while read requirement; do conda install --yes $requirement || pip install $requirement; done < $1



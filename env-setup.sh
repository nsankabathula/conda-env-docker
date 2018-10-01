#!/bin/bash

conda install pip
#pip install --upgrade pip
conda update --name en-nlp pip
echo "Installing using requirement file: $1"
while read requirement; do conda install --yes $requirement || pip install $requirement; done < $1

#!/bin/bash

sudo apt-get install gcc
echo "Creating conda env.."
conda create --yes --name en-nlp
echo "Activating conda env.."
source activate en-nlp
echo "Installing & Upgrading pip.."
conda install pip
#pip install --upgrade pip
conda update --name en-nlp pip
echo "Installing using requirement file: $1"
while read requirement; do conda install --yes $requirement || pip install $requirement; done < $1

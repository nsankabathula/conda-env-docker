#!/bin/bash

echo "Installing using requirement file: $1"
while read requirement; do conda install --yes $requirement || pip install $requirement; done < $1

conda install --quiet --yes -c conda-forge gensim



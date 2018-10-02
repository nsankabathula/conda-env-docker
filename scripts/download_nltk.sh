#!/bin/bash

if [ -n "$1" ]
then
  source activate $1
fi

python -m nltk.downloader brown

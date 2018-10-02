#!/bin/bash

if [ -n "$1" ]
  source activate $1

python -m nltk.downloader brown

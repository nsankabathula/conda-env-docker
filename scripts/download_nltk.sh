#!/bin/bash

source activate $1

python -m nltk.downloader all

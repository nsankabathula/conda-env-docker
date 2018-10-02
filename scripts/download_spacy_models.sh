#!/bin/bash

source activate $1

python -m spacy download en_core_web_lg
python -m spacy download en_core_web_sm



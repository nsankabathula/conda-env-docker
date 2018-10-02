#!/bin/bash

source activate docker-env
jupyter notebook --allow-root --notebook-dir=/opt/notebooks  --ip='*' --port=8888 --no-browser

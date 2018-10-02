#!/bin/bash

source activate conda-env
jupyter notebook --allow-root --notebook-dir=/opt/notebooks  --ip='*' --port=8888 --no-browser

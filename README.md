# conda-env-docker

docker build -t condatest .

docker run -it condatest

## Usage
You can download and run this image using the following commands:

docker run -i -t continuumio/anaconda3 /bin/bash
Alternatively, you can start a Jupyter Notebook server and interact with Anaconda via your browser:

docker run -i -t -p 8888:8888 continuumio/anaconda3 /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser"
You can then view the Jupyter Notebook by opening http://localhost:8888 in your browser, or http://<DOCKER-MACHINE-IP>:8888 if you are using a Docker Machine VM.

docker run --name conda-env-test -p 8888:8888 -v "$PWD/notebooks:/opt/notebooks" -d condatest

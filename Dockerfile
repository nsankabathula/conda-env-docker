FROM continuumio/anaconda3

ADD conda-env.yml /tmp/environment.yml
ADD env*.* /tmp/
RUN conda env create -f /tmp/environment.yml


# Pull the environment name out of the environment.yml
RUN echo "source activate $(head -1 /tmp/environment.yml | cut -d' ' -f2)" > ~/.bashrc
ENV PATH /opt/conda/envs/$(head -1 /tmp/environment.yml | cut -d' ' -f2)/bin:$PATH

RUN conda update --all
WORKDIR /tmp/
RUN ./env-setup.sh env_dev_requirements.txt



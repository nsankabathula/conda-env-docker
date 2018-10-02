FROM continuumio/anaconda3

ADD conda-env.yml /tmp/environment.yml
ADD env*.* /tmp/
RUN conda env create -f /tmp/environment.yml

#RUN conda create --name conda-env python=3.6
# Pull the environment name out of the environment.yml
RUN echo "source activate $(head -1 /tmp/environment.yml | cut -d' ' -f2)" > ~/.bashrc
ENV PATH /opt/conda/envs/$(head -1 /tmp/environment.yml | cut -d' ' -f2)/bin:$PATH

#RUN conda install pip
RUN conda update --all
WORKDIR /tmp/
RUN ./env-setup.sh env_dev_requirements.txt



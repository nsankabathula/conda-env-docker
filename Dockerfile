#FROM continuumio/anaconda3
FROM continuumio/miniconda3
RUN conda install nb_conda
RUN conda install pip
RUN conda update pip

ADD conda-env.yml /tmp/environment.yml
ADD env*.* /tmp/
RUN conda env create -f /tmp/environment.yml

#RUN conda create --name conda-env python=3.6
# Pull the environment name out of the environment.yml
RUN echo "source activate $(head -1 /tmp/environment.yml | cut -d' ' -f2)" > ~/.bashrc
ENV PATH /opt/conda/envs/$(head -1 /tmp/environment.yml | cut -d' ' -f2)/bin:$PATH

RUN conda config --set core.default_env $(head -1 /tmp/environment.yml | cut -d' ' -f2)


#RUN conda update --all
# Updating Anaconda packages
#RUN conda update conda
#RUN conda update anaconda
#RUN conda update --all

#WORKDIR /tmp/
RUN ./tmp/env-setup.sh /tmp/env_dev_requirements.txt


# Configuring access to Jupyter
RUN mkdir /opt/notebooks
RUN jupyter notebook --generate-config --allow-root
RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /root/.jupyter/jupyter_notebook_config.py
# Jupyter listens port: 8888
EXPOSE 8888
# Run Jupytewr notebook as Docker main process
CMD ["jupyter", "notebook", "--allow-root", "--notebook-dir=/opt/notebooks", "--ip='*'", "--port=8888", "--no-browser"]

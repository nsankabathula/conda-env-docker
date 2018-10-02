#FROM continuumio/anaconda3
FROM continuumio/miniconda3


ADD /env/ /tmp/
ADD /scripts/ /scripts/


RUN conda env create -f /tmp/env-conda.yml
# Pull the environment name out of the environment.yml
RUN echo "source activate $(head -1 /tmp/env-conda.yml | cut -d' ' -f2)" > ~/.bashrc
ENV PATH /opt/conda/envs/$(head -1 /tmp/env-conda.yml | cut -d' ' -f2)/bin:$PATH

#RUN conda config --set core.default_env $(head -1 /tmp/environment.yml | cut -d' ' -f2)

# Manual env setup
#RUN ./tmp/env-setup.sh /tmp/env-requirements.txt
RUN /bin/bash -c "source activate $(head -1 /tmp/env-conda.yml | cut -d' ' -f2)"

RUN conda install jupyter

RUN ./scripts/download_nltk.sh $(head -1 /tmp/env-conda.yml | cut -d' ' -f2)
RUN ./scripts/download_spacy_models.sh $(head -1 /tmp/env-conda.yml | cut -d' ' -f2)

# Configuring access to Jupyter
RUN mkdir /home/src

RUN jupyter notebook --generate-config --allow-root
RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /root/.jupyter/jupyter_notebook_config.py

# Jupyter listens port: 8888
EXPOSE 8888
# Run Jupytewr notebook as Docker main process
RUN /bin/bash -c "source activate $(head -1 /tmp/env-conda.yml | cut -d' ' -f2)"
CMD ["jupyter", "notebook", "--allow-root", "--notebook-dir=/home/src", "--ip='*'", "--port=8888", "--no-browser"]


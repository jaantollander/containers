FROM condaforge/mambaforge:22.9.0-3
# https://github.com/conda-forge/miniforge-images/blob/master/ubuntu/Dockerfile

COPY env.yml /opt/env.yml
COPY scripts/ml.py /opt/ml.py

RUN conda install env -f /opt/env.yml

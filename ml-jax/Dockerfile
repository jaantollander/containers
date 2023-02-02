FROM condaforge/mambaforge:22.9.0-3
# https://github.com/conda-forge/miniforge-images/blob/master/ubuntu/Dockerfile
# TODO: make sure that we the python from the conda environment

COPY env.yml /opt/env.yml
COPY scripts/ml.py /opt/ml.py
RUN chmod +x /opt/ml.py && \
    ln -sf /opt/ml.py /usr/local/bin/ml
RUN conda install env -f /opt/env.yml

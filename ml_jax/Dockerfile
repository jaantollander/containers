FROM condaforge/mambaforge:22.9.0-3

ARG ENV_NAME=ml_jax
ENV PATH="/opt/conda/envs/$ENV_NAME/bin:$PATH"

COPY ./env.lock /opt/env.yml
RUN mamba env create --quiet --name "$ENV_NAME" --file /opt/env.yml

COPY ./scripts/ml.py /opt/ml.py
RUN chmod +x /opt/ml.py && \
    ln -sf /opt/ml.py /usr/local/bin/ml

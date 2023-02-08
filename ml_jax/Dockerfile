FROM condaforge/mambaforge:22.9.0-3

ARG NAME=jax
ENV PATH="/opt/conda/envs/$NAME/bin:$PATH"

COPY ./env.yml /opt/env.yml
RUN mamba env create --name "$NAME" --file /opt/env.yml

COPY ./scripts/ml.py /opt/ml.py
RUN chmod +x /opt/ml.py && \
    ln -sf /opt/ml.py /usr/local/bin/ml

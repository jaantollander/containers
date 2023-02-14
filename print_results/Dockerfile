FROM library/base:latest

ARG CONDA_ENV=print_results
ENV PATH="/opt/conda/envs/$CONDA_ENV/bin:$PATH"

COPY ./env.yml /opt/env.yml
RUN mamba env create --quiet --name "$CONDA_ENV" --file /opt/env.yml

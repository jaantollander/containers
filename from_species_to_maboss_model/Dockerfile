FROM condaforge/mambaforge:4.10.3-10

ARG ENV_NAME=pypath
ENV PATH=/opt/conda/envs/$ENV_NAME/bin:$PATH

COPY ./env.yml /opt/env.yml
COPY ./scripts/download_database.py /opt/download_database.py

RUN mamba env create --quiet --name "$ENV_NAME" --file /opt/env.yml && \
    mkdir -p /opt/FromSpeciesToMaBoSSModel && \
    /opt/conda/envs/"$ENV_NAME"/bin/python /opt/download_database.py \
       /opt/FromSpeciesToMaBoSSModel/cache /opt/FromSpeciesToMaBoSSModel/network.pickle


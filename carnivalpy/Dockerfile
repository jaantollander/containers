FROM library/base:latest

ARG CONDA_ENV=carnivalpy
ENV PATH=/opt/conda/envs/${CONDA_ENV}/bin:${PATH}
ENV LD_LIBRARY_PATH=/opt/env/:${LD_LIBRARY_PATH}

COPY ./env.yml /opt/env.yml
RUN mamba env create --quiet --name "$CONDA_ENV" --file /opt/env.yml

COPY ./scripts/carnivalpy.sh /opt/carnivalpy.sh
COPY ./scripts/export.R /opt/export.R
COPY ./scripts/feature_merge.py /usr/local/bin/feature_merger
RUN chmod +x /usr/local/bin/feature_merger

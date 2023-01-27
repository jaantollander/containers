FROM condaforge/mambaforge:4.10.3-10

ENV PATH=/opt/conda/envs/pypath_env/bin/:$PATH

RUN mkdir -p /opt/FromSpeciesToMaBoSSModel

COPY pypath_env.yml /opt/FromSpeciesToMaBoSSModel/env.yml
COPY download_database.py /opt/FromSpeciesToMaBoSSModel/download_database.py

RUN /opt/conda/bin/mamba env create -f /opt/FromSpeciesToMaBoSSModel/env.yml && \
    /opt/conda/envs/pypath_env/bin/python /opt/FromSpeciesToMaBoSSModel/download_database.py \
       /opt/FromSpeciesToMaBoSSModel/cache /opt/FromSpeciesToMaBoSSModel/network.pickle


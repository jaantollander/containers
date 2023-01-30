FROM ubuntu:20.04

ENV PATH="/usr/local/bin:$PATH"

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq r-base default-jre default-jdk git flex bison python-is-python3 pip wget && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    (cd /usr/local; mkdir scm; cd scm; git clone https://github.com/sysbio-curie/MaBoSS-env-2.0.git -b v2.4.1; cd MaBoSS-env-2.0/engine/src; make && make install) && \
    (cd /usr/local/bin; ln -s /usr/local/scm/MaBoSS-env-2.0/engine/pub/* .) && \
    mkdir /usr/local/jar && \
    wget https://b2drop.bsc.es/index.php/s/SRWPNAkKL73oaRw/download -O /usr/local/jar/BiNoM.jar && \
    wget https://github.com/auranic/VDAOEngine/raw/master/jar/VDAOEngine.jar -O /usr/local/jar/VDAOEngine.jar

# ENTRYPOINT /bin/bash
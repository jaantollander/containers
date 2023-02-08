FROM ubuntu:22.04

# ASL 2.0 license
# https://b2drop.bsc.es/index.php/s/SRWPNAkKL73oaRw/download
COPY ./jar/BiNoM.jar /usr/local/jar/BiNoM.jar

# TODO: license compatibility issues?
# LGPL-3.0 license
# https://github.com/auranic/VDAOEngine/raw/master/jar/VDAOEngine.jar
COPY ./jar/VDAOEngine.jar /usr/local/jar/VDAOEngine.jar

RUN apt-get --quiet update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        "r-base=4.1.2*" \
        "default-jre=2:1.11*" \
        "default-jdk=2:1.11*" \
        "perl=5.34.0*" \
        "python3=3.10.6*" \
        "python3-pip=22.0.2*" \
        "wget=1.21.2*" \
        "unzip=6.0*" && \
    rm -rf /var/lib/apt/lists/* && \
    ln -sf /usr/bin/python3 /usr/bin/python

# TODO: can we remove unnecessary files after the build?
#RUN apt-get --quiet update && \
#    DEBIAN_FRONTEND=noninteractive \
#    apt-get install --assume-yes --no-install-recommends \
#        "flex=2.6.4*" \
#        "bison=2:3.8.2*" \
#        "gcc=4:11.2.0*" \
#        "g++=4:11.2.0*" \
#        "make=4.3*" && \
#    rm -rf /var/lib/apt/lists/* && \
#    wget --no-hsts "https://github.com/sysbio-curie/MaBoSS-env-2.0/archive/refs/tags/v2.4.1.zip" && \
#    unzip -o "v2.4.1.zip" /usr/local/src/ && \
#    rm "v2.4.1.zip" && \
#    (cd /usr/local/src/MaBoSS-env-2.0-2.4.1/engine/src && make && make install ;) && \
#    ln -sf /usr/local/src/MaBoSS-env-2.0-2.4.1/engine/pub/* /usr/local/bin

RUN wget --no-hsts --quiet https://github.com/sysbio-curie/MaBoSS-env-2.0/releases/download/v2.4.1/MaBoSS-linux64.zip && \
    unzip -o MaBoSS-linux64.zip -d /usr/local/bin/ && \
    rm MaBoSS-linux64.zip

COPY ./requirements.txt /opt/requirements.txt
RUN pip3 install --no-cache-dir -r /opt/requirements.txt

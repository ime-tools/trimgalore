FROM debian:stretch

LABEL maintainer="frank.foerster@ime.fraunhofer.de"
LABEL description="Dockerfile providing the trimgalore trimming software"

RUN apt-get update && apt-get -y upgrade cutadapt fastqc wget tar gzip

RUN cd /opt && \
    wget -O - https://github.com/FelixKrueger/TrimGalore/archive/0.4.4.tar.gz | tar xzf - && \
    ln -s $(find /opt -name "trim_galore") /usr/bin/

VOLUME /data

WORKDIR /data

ENTRYPOINT trim_galore

CMD ["--help"]



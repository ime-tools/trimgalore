ARG osversion=xenial
FROM ubuntu:${osversion}

ARG VERSION=master
ARG VCS_REF
ARG BUILD_DATE

RUN echo "VCS_REF: "${VCS_REF}", BUILD_DATE: "${BUILD_DATE}", VERSION: "${VERSION}

LABEL maintainer="frank.foerster@ime.fraunhofer.de" \
      description="Dockerfile providing the trimgalore trimming software" \
      version=${VERSION} \
      org.label-schema.vcs-ref=${VCS_REF} \
      org.label-schema.build-date=${BUILD_DATE} \
      org.label-schema.vcs-url="https://github.com/ime-tools/trimgalore.git"

RUN apt-get update && apt-get -y upgrade cutadapt fastqc wget tar gzip

RUN cd /opt && \
    wget -O - https://github.com/FelixKrueger/TrimGalore/archive/0.4.4.tar.gz | tar xzf - && \
    ln -s $(find /opt -name "trim_galore") /usr/bin/

VOLUME /data

WORKDIR /data

ENTRYPOINT trim_galore

CMD ["--help"]



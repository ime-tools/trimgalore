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

RUN apt-get update && \
    apt-get --yes install \
	python-cutadapt \
	libfindbin-libs-perl \
	openjdk-8-jre-headless \
	unzip \
	parallel \
	wget \
	tar \
	gzip && \
    apt --yes autoremove \
    && apt autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log

WORKDIR /opt
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip && \
    unzip fastqc_v0.11.7.zip && \
    rm -rf fastqc_v0.11.7.zip && \
    chmod +x FastQC/fastqc
ENV PATH "${PATH}":/opt/FastQC/

WORKDIR /opt
RUN wget -O - https://github.com/FelixKrueger/TrimGalore/archive/0.4.5.tar.gz | tar xzf - && \
    ln -s $(find /opt -name "trim_galore") /usr/bin/

VOLUME /data
WORKDIR /data

ENTRYPOINT ["/usr/bin/trim_galore"]

CMD ["--help"]



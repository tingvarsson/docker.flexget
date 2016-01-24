# FlexGet
#
# Version 1.0.0

FROM ubuntu:15.10
MAINTAINER Thomas Ingvarsson <ingvarsson.thomas@gmail.com>

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update \
    && apt-get install -y python python-dev python-pip unrar-free \
    && pip install flexget \
    && pip install transmissionrpc \
    && pip install rarfile \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

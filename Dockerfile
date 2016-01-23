# FlexGet
#
# Version 1.0

FROM ubuntu:15.10
MAINTAINER Thomas Ingvarsson <ingvarsson.thomas@gmail.com>

RUN apt-get update \
    && apt-get install -y python python-dev python-pip unrar-free \
    && pip install flexget \
    && pip install transmissionrpc \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

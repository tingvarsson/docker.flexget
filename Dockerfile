# FlexGet
#
# Version 1.0

FROM ubuntu:15.10
MAINTAINER Thomas Ingvarsson <ingvarsson.thomas@gmail.com>

# Update packages and install software
RUN apt-get update \
    && apt-get -y install software-properties-common \
    && apt-get update \
    && apt-get install -y python python-pip \
    && pip install flexget

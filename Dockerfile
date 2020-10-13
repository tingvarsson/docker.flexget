# FlexGet
#
# Version latest

FROM python:3.8-alpine
LABEL maintainer "Thomas Ingvarsson <ingvarsson.thomas@gmail.com>"

RUN apk add --no-cache \
    unrar \
    nodejs \
    && apk add --no-cache --virtual=build-dependencies \
    build-base \
    ca-certificates \
    jpeg-dev \
    libffi-dev \
    libxml2-dev \
    libxslt-dev \
    openssl-dev \
    && pip install --upgrade \
    setuptools \
    && pip install \
    cfscrape \
    cloudscraper \
    flexget \
    rarfile \
    subliminal==2.0.5 \
    transmissionrpc \
    && apk del build-dependencies

VOLUME /flexget
WORKDIR /flexget

COPY start.sh /start.sh

CMD ["/start.sh"]

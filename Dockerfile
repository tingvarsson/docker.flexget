FROM python:3.9-alpine3.14
LABEL maintainer "Thomas Ingvarsson <ingvarsson.thomas@gmail.com>"

ARG FLEXGET_VERSION

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
    flexget==$FLEXGET_VERSION \
    rarfile \
    subliminal==2.0.5 \
    transmission-rpc \
    && apk del build-dependencies

VOLUME /flexget
WORKDIR /flexget

COPY start.sh /start.sh

CMD ["/start.sh"]

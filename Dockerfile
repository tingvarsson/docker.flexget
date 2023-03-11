# Flexget version is provided via build arg
ARG FLEXGET_VERSION

ARG UNRAR_VERSION=6.1.7
ARG UNRAR_URL=https://www.rarlab.com/rar/unrarsrc-${UNRAR_VERSION}.tar.gz

# Build unrar.  It has been moved to non-free since Alpine 3.15.
# https://wiki.alpinelinux.org/wiki/Release_Notes_for_Alpine_3.15.0#unrar_moved_to_non-free
FROM alpine:3.17 AS unrar
ARG UNRAR_URL
COPY src/unrar /build
RUN /build/build.sh "$UNRAR_URL"


# Build flexget image
FROM python:3.11-alpine3.17
LABEL maintainer "Thomas Ingvarsson <ingvarsson.thomas@gmail.com>"

ARG FLEXGET_VERSION

COPY --from=unrar /tmp/unrar-install/usr/bin/unrar /usr/bin/unrar

RUN apk add --no-cache \
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
    subliminal \
    transmission-rpc==3.4.1 \
    && apk del build-dependencies

VOLUME /flexget
WORKDIR /flexget

COPY start.sh /start.sh

CMD ["/start.sh"]

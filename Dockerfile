FROM python:3.8-alpine
LABEL maintainer "Thomas Ingvarsson <ingvarsson.thomas@gmail.com>"

ARG BUILD_DATE
ARG VCS_REF
ARG FLEXGET_VERSION

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="tingvarsson/flexget"
LABEL org.label-schema.description="FlexGet image based on Alpine Linux"
LABEL org.label-schema.vcs-url="https://github.com/tingvarsson-docker/docker.flexget"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.version=$FLEXGET_VERSION

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
    transmissionrpc \
    && apk del build-dependencies

VOLUME /flexget
WORKDIR /flexget

COPY start.sh /start.sh

CMD ["/start.sh"]

# FlexGet
#
# Version latest

FROM python:alpine
LABEL maintainer "Thomas Ingvarsson <ingvarsson.thomas@gmail.com>"

RUN apk add --no-cache unrar nodejs && \
    apk add --no-cache --virtual=build-dependencies build-base libffi-dev openssl-dev ca-certificates && \
    pip install --upgrade setuptools && \
    pip install flexget transmissionrpc rarfile cfscrape cloudscraper subliminal && \
    apk del build-dependencies

VOLUME /flexget
WORKDIR /flexget

COPY start.sh /start.sh

CMD ["/start.sh"]

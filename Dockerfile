# FlexGet
#
# Version latest

FROM tingvarsson/python:latest
MAINTAINER Thomas Ingvarsson <ingvarsson.thomas@gmail.com>

RUN apk add --no-cache unrar nodejs && \
    apk add --no-cache --virtual=build-dependencies ca-certificates && \
    pip install --upgrade setuptools && \
    pip install flexget transmissionrpc rarfile cfscrape subliminal && \
    apk del build-dependencies

CMD ["flexget", "daemon", "start"]
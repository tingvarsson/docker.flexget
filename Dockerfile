# FlexGet
#
# Version 2.0.0

FROM tingvarsson/python:1.0.0
MAINTAINER Thomas Ingvarsson <ingvarsson.thomas@gmail.com>

RUN apk add --no-cache unrar && \
    apk add --no-cache --virtual=build-dependencies python-dev && \
    pip install flexget transmissionrpc rarfile && \
    apk del build-dependencies
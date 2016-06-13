# FlexGet
#
# Version 2.0.0

FROM tingvarsson/python:latest
MAINTAINER Thomas Ingvarsson <ingvarsson.thomas@gmail.com>

RUN apk add --no-cache unrar && \
    apk add --no-cache --virtual=build-dependencies python-dev ca-certificates && \
    pip install flexget==1.2.521 transmissionrpc rarfile && \
    apk del build-dependencies
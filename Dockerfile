# FlexGet
#
# Version 3.0.0

FROM tingvarsson/python:2
MAINTAINER Thomas Ingvarsson <ingvarsson.thomas@gmail.com>

RUN apk add --no-cache unrar && \
    apk add --no-cache --virtual=build-dependencies python-dev ca-certificates && \
    pip install flexget transmissionrpc rarfile && \
    apk del build-dependencies

CMD ["flexget", "daemon", "start"]
# FlexGet
#
# Version 3.2.0

FROM tingvarsson/python:latest
MAINTAINER Thomas Ingvarsson <ingvarsson.thomas@gmail.com>

RUN apk add --no-cache unrar && \
    apk add --no-cache --virtual=build-dependencies ca-certificates && \
    pip install flexget transmissionrpc rarfile && \
    apk del build-dependencies

CMD ["flexget", "daemon", "start"]
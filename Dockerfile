# FlexGet
#
# Version 3.0.0

FROM tingvarsson/python:latest
MAINTAINER Thomas Ingvarsson <ingvarsson.thomas@gmail.com>

RUN apk add --no-cache unrar && \
    pip install flexget transmissionrpc rarfile

CMD ["flexget", "daemon", "start"]
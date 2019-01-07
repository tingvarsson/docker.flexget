# FlexGet
#
# Version latest

FROM python:3.7-alpine
LABEL maintainer "Thomas Ingvarsson <ingvarsson.thomas@gmail.com>"

RUN apk add --no-cache unrar nodejs && \
    apk add --no-cache --virtual=build-dependencies ca-certificates && \
    pip install --upgrade setuptools && \
    pip install flexget transmissionrpc rarfile cfscrape subliminal && \
    apk del build-dependencies

WORKDIR /flexget

COPY start.sh /flexget/start.sh

CMD ["./start.sh"]

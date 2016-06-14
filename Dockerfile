# FlexGet
#
# Version 2.0.0

FROM tingvarsson/python:latest
MAINTAINER Thomas Ingvarsson <ingvarsson.thomas@gmail.com>

RUN apk add --no-cache unrar && \
    apk add --no-cache --virtual=build-dependencies python-dev ca-certificates && \
    pip install "flexget>=1.0,<2.0" transmissionrpc rarfile "apscheduler<3.1.0,>=3.0.3" && \
    apk del build-dependencies

CMD ["flexget", "daemon", "start"]
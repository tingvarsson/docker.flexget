# Flexget version is provided via build arg
ARG FLEXGET_VERSION

FROM registry.access.redhat.com/ubi9/python-312-minimal
LABEL maintainer "Thomas Ingvarsson <ingvarsson.thomas@gmail.com>"

ARG FLEXGET_VERSION

# Change to root to allow installing with dnf, then back to non-root user as in base image
USER root
RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
    && microdnf install -y unrar \
    && microdnf clean all
USER 1001

RUN pip install --upgrade pip \
    && pip install --upgrade setuptools \
    && pip install \
    cfscrape \
    cloudscraper \
    flexget==$FLEXGET_VERSION \
    rarfile \
    subliminal \
    transmission-rpc

VOLUME /flexget
WORKDIR /flexget

COPY start.sh /start.sh

CMD ["/start.sh"]

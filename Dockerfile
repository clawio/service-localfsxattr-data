FROM golang:1.5
MAINTAINER Hugo González Labrador

ENV CLAWIO_LOCALFSXATTR_DATA_DATADIR /tmp/localfsxattr-mysql
ENV CLAWIO_LOCALFSXATTR_DATA_TMPDIR /tmp/localfsxattr-mysql
ENV CLAWIO_LOCALFSXATTR_DATA_CHECKSUM md5
ENV CLAWIO_LOCALFSXATTR_DATA_PORT 57012
ENV CLAWIO_LOCALFSXATTR_DATA_LOGLEVEL "error"
ENV CLAWIO_LOCALFSXATTR_DATA_PROP "service-localfsxattr-mysqlprop:57013"
ENV CLAWIO_SHAREDSECRET secret

ADD . /go/src/github.com/clawio/service-localfsxattr-data
WORKDIR /go/src/github.com/clawio/service-localfsxattr-data

RUN go get -u github.com/tools/godep
RUN godep restore
RUN go install

ENTRYPOINT /go/bin/service-localfsxattr-data

EXPOSE 57012


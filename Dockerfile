FROM golang:1.5
MAINTAINER Hugo González Labrador

ENV CLAWIO_LOCALSTOREXATTRDATA_DATADIR /tmp
ENV CLAWIO_LOCALSTOREXATTRDATA_TMPDIR /tmp
ENV CLAWIO_LOCALSTOREXATTRDATA_PORT 57012
ENV CLAWIO_LOCALSTOREXATTRDATA_CHECKSUM md5
ENV CLAWIO_LOCALSTOREXATTRDATA_PROP "service-localstorexattr-prop:57013"
ENV CLAWIO_SHAREDSECRET secret

ADD . /go/src/github.com/clawio/service.localstorexattr.data
WORKDIR /go/src/github.com/clawio/service.localstorexattr.data

RUN go get -u github.com/tools/godep
RUN godep restore
RUN go install

ENTRYPOINT /go/bin/service.localstorexattr.data

EXPOSE 57012


FROM alpine:3.3
MAINTAINER Lars Krantz

ENV TEMP_BACKUP_DIR /tempdir
RUN mkdir $TEMP_BACKUP_DIR

RUN apk -Uv add python py-pip \
 && apk -UvX http://dl-4.alpinelinux.org/alpine/edge/main add bash \
 && apk -UvX http://dl-4.alpinelinux.org/alpine/edge/main add lftp \
 && pip install --upgrade pip \
 && pip install awscli \
 && apk --purge -v del py-pip \
 && rm -rf /var/cache/apk/*
ADD ./download_and_sync /

ENTRYPOINT ["/download_and_sync"]

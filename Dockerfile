FROM lsiobase/alpine:3.10

LABEL maintainer="horjulf"

ENV \
    SSHFS_HOST= \
    SSHFS_MNT=/mnt \
    SSHFS_OPTS=

# Install packages
RUN \
    echo "**** install packages ****" && \
    apk add --no-cache -U \
        sshfs && \
    echo "**** cleanup ****" && \
    rm -rf \
        /tmp/*

# Add local files
COPY root/ /

VOLUME ["/config"]

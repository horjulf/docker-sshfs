FROM lsiobase/alpine:edge

LABEL maintainer="horjulf"

ENV \
    SSHFS_MNT_PATH=/mnt

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

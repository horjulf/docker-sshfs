ARG TAG=3.12
FROM sc4h/alpine-s6overlay:${TAG}

LABEL maintainer="horjulf"

ENV \
    SSHFS_HOST= \
    SSHFS_MNT=/mnt \
    SSHFS_OPTS=

# Install packages
RUN \
    echo "**** install packages ****" && \
    apk add --no-cache -U \
        fuse3 \
        sshfs && \
    sshfs -V && \
    echo "**** cleanup ****" && \
    rm -rf \
        /tmp/*

# Add local files
COPY root/ /

VOLUME ["/config"]

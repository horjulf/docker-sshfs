# docker-sshfs

Mount SSHFS on the host with a container.

Command executed in the container:

- `sshfs -f ${SSHFS_OPTS} ${SSHFS_MNT_PATH}`

## Usage

```bash
docker create --name=sshfs \
    -e PUID=<uid> \
    -e PGID=<gid> \
    -e TZ=<timezone> \
    -e SSHFS_OPTS="-p <port> -o IdentityFile=/config/<ssh_key> -o noatime -o reconnect <user>@<host>:<path>" \
    --cap-add=SYS_ADMIN \
    --device=/dev/fuse \
    -v <config_path>:/config \
    -v <mnt_path>:/mnt:shared \
    horjulf/sshfs
```

```bash
docker start sshfs
```

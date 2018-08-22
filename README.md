# buildkit-umask-repro

Dockerfile `COPY` doesn't create correct permissions on destination directory in Buildkit.

Buildkit:
```sh
total 12
drwx------    2 root     root          4096 Aug 22 19:06 .
drwxr-xr-x    1 root     root          4096 Aug 22 20:23 ..
-rwxrwxr-x    1 1001     1001            27 Aug 22 19:04 echo.sh
```

Docker (`18.06.0-ce-dev`):
```sh
total 12
drwxr-xr-x    2 root     root          4096 Aug 22 19:04 .
drwxr-xr-x    1 root     root          4096 Aug 22 20:23 ..
-rwxrwxr-x    1 root     root            27 Aug 22 19:04 echo.sh
```

# Reproduction

```sh
$ make docker
# ...
Hello world
$ make buildctl
# ...
Can't exec "/scripts/echo.sh": Permission denied at /usr/local/bin/setuidgid line 43.
failed to exec: /scripts/echo.sh:Permission denied at /usr/local/bin/setuidgid line 43.
```

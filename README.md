# The script adds mirrors for the Alpine apk

#### <i class="icon-file"></i> Dockerfile example

```
FROM alpine

# You shoud install openssl for download from https host
...

# Adding mirrors
RUN wget https://raw.githubusercontent.com/xtimon/add_alpine_mirrors/master/add_mirrors.sh \
    && chmod +x add_mirrors.sh \
    && ./add_mirrors.sh
```
> **Note:**

> - You can use your own repositories list by the environment `MIRRORS_LIST` (default value: `http://rsync.alpinelinux.org/alpine/MIRRORS.txt`)
> - You can limit repositories from the mirrors list by the environment `MIRRORS_COUNT` (default value: `5`)


#### <i class="icon-file"></i> Dockerfile with environments example

```
FROM alpine

ENV MIRRORS_LIST="http://your_repo_list_address" \
    MIRRORS_COUNT=10

# You shoud install openssl for download from https host
...

# Adding mirrors
RUN wget https://raw.githubusercontent.com/xtimon/add_alpine_mirrors/master/add_mirrors.sh \
    && chmod +x add_mirrors.sh \
    && ./add_mirrors.sh
```


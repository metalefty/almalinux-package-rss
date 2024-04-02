## Build

```sh
docker build -t alpr/8 --build-arg RELVER=8 github.com/metalefty/almalinux-package-rss
docker build -t alpr/9 --build-arg RELVER=9 github.com/metalefty/almalinux-package-rss
```

## Run

```sh
docker run --rm -it -v ./feeds:/app/output alpr/9
docker run --rm -it -v ./feeds:/app/output alpr/8
```

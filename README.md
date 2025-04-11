## Build

```sh
podman build -t alpr/8 --build-arg RELVER=8 https://github.com/metalefty/almalinux-package-rss.git
podman build -t alpr/9 --build-arg RELVER=9 https://github.com/metalefty/almalinux-package-rss.git
podman build -t alpr-rss-merge --build-arg RELVER=9 -f Containerfile.rss-merge github.com/metalefty/almalinux-package-rss.git
```

## Run

```sh
podman run --rm -it -v ./feeds:/app/output alpr/9
podman run --rm -it -v ./feeds:/app/output alpr/8
podman run --rm -it -v ./feeds:/app/output alpr-rss-merge
```

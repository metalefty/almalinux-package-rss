ARG RELVER=9
FROM almalinux:${RELVER}

WORKDIR /app
RUN mkdir output
RUN dnf -y update && dnf -y install python3
RUN curl -O https://git.resf.org/sig_core/toolkit/raw/branch/devel/mangle/generators/rss.py && \
RUN curl -O https://gist.githubusercontent.com/metalefty/db0f76bf7438c57534e420c0a1526dde/raw/2288521b6902796fe173513c940dc78c1a54a9e2/rss.py && \
	chmod +x rss.py

VOLUME /app/output

COPY entrypoint.sh /app

ENTRYPOINT ["./entrypoint.sh"]

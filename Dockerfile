ARG RELVER=9
FROM almalinux:${RELVER}

WORKDIR /app
RUN mkdir output
RUN dnf -y update && dnf -y install python3
# Do not fail if synergy is not available such as on Kitten 10
RUN dnf -y install almalinux-release-synergy || true
RUN curl -O https://gist.githubusercontent.com/metalefty/db0f76bf7438c57534e420c0a1526dde/raw/2288521b6902796fe173513c940dc78c1a54a9e2/rss.py && \
	chmod +x rss.py

VOLUME /app/output

COPY entrypoint.sh /app

ENTRYPOINT ["./entrypoint.sh"]

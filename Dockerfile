ARG RELVER=9
FROM almalinux:${RELVER}

WORKDIR /app
RUN mkdir output
RUN dnf -y update && dnf -y install python3
RUN curl -O https://git.resf.org/sig_core/toolkit/raw/branch/devel/mangle/generators/rss.py && \
	chmod +x rss.py

VOLUME /app/output

COPY entrypoint.sh /app

ENTRYPOINT ["./entrypoint.sh"]

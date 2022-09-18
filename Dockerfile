ARG VERSION=latest
FROM ghcr.io/tailscale/tailscale:${VERSION} as tailscale

FROM alpine:latest
WORKDIR /app

COPY --from=tailscale /usr/local/bin/tailscale .
COPY --from=tailscale /usr/local/bin/tailscaled .

COPY ./run.sh .
CMD /app/supervisor.sh

MAINTAINER Amir Omidi amir@aaomidi.com

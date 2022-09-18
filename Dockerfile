ARG VERSION=latest
FROM ghcr.io/tailscale/tailscale:{VERSION} as tailscale

FROM alpine:latest
WORKDIR /app

COPY --from=tailscale /usr/local/bin/tailscale /app/
COPY --from=tailscale /usr/local/bin/tailscaled /app/

COPY ./run.sh /app
ENTRYPOINT ["/app/run.sh"]

MAINTAINER Amir Omidi amir@aaomidi.com

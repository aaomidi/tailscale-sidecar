ARG VERSION=latest
FROM ghcr.io/tailscale/tailscale:${VERSION} as tailscale

FROM alpine:latest
RUN apk add --no-cache ca-certificates iptables iproute2 ip6tables

WORKDIR /app

COPY --from=tailscale /usr/local/bin/tailscale .
COPY --from=tailscale /usr/local/bin/tailscaled .

COPY ./run.sh .
CMD /app/run.sh

MAINTAINER Amir Omidi amir@aaomidi.com

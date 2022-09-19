# tailscale-sidecar


Example:

```
services:
  tailscale:
    image: ghcr.io/aaomidi/tailscale-sidecar:latest
    hostname: tailscale
    container_name: tailscale
    restart: unless-stopped
    privileged: true
    cap_add:
      - net_admin
      - sys_module
    environment:
      - "UP_FLAGS=--advertise-routes=10.0.1.0/24"
```

#!/bin/ash

export PATH=$PATH:/usr/local/bin

echo "Starting tailscaled"
/app/tailscaled --state=/state/tailscaled.state --statedir=/state/ &

# Wait for tailscale
sleep 3

echo "Starting tailscale"
/app/tailscale up ${UP_FLAGS:-}


# Do nothing
sleep infinity

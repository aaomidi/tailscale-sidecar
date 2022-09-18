#!/bin/bash

export PATH=$PATH:/usr/local/bin

/app/tailscaled --state=/state/tailscaled.state --statedir=/state/ &

# Wait for tailscale
sleep 3

tailscale up ${UP_FLAGS:-}


# Do nothing
sleep infinity

#!/bin/sh

./tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock --tun=userspace-networking --socks5-server=0.0.0.0:1055 --outbound-http-proxy-listen=0.0.0.0:1055 &
until ./tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=${TAILSCALE_HOSTNAME} --login-server=${TAILSCALE_LOGIN_SERVER} ${TAILSCALE_ADDITIONAL_ARGS}; do
  sleep 0.1
done
sleep infinity

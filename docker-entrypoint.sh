#!/bin/bash

HOST_DOMAIN="host.docker.internal"
ping -q -c1 $HOST_DOMAIN > /dev/null 2>&1
if [ $? -ne 0 ]; then
  HOST_IP=$(ip route | awk 'NR==1 {print $3}')
  echo -e "$HOST_IP\t$HOST_DOMAIN" | sudo tee --append "/etc/hosts"
fi
export PYTHONPATH=$PYTHONPATH:/home/pi/lib_emulator/:/home/pi/emulated_modules
exec "$@"

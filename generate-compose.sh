#!/bin/bash

echo "version: '3.8'"
echo "services:"

port_base=2200
index=1

while read -r username password; do
  port=$((port_base + index))

  cat <<EOF
  $username:
    build: .
    container_name: $username
    ports:
      - "${port}:22"
    environment:
      - USERNAME=$username
      - PASSWORD=$password
    restart: unless-stopped
    tty: true
    stdin_open: true

EOF

  index=$((index + 1))
done < users.txt

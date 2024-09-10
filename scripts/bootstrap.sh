#!/bin/bash

# Check if domain parameter is provided
if [ -z "$1" ]; then
  echo "Usage: ./bootstrap.sh <domain>"
  exit 1
fi

DOMAIN=$1

# Create directories for Traefik if they do not exist
mkdir -p config/ca


openssl genrsa -out config/ca/root.key 4096
openssl req -x509 -new -sha256 -days 3650 -nodes -subj "/CN=$DOMAIN" -key config/ca/root.key -out config/ca/root.pem

# Generate the public key (certificate) that can be imported into the Windows key store
openssl x509 -outform der -in config/ca/root.pem -out config/ca/root_public.der


# Initialize the acme.json file with correct permissions
touch config/traefik/acme/acme.json
sudo chmod 600 config/traefik/acme/acme.json

echo "Spinning up Traefik and the services, leaving for 30s to load and configure"

docker compose -f docker-compose.base.yaml up -d
sleep 30
docker compose -f docker-compose.base.yaml down

echo "Bootstrap complete. Certificates generated and acme.json initialized."
echo "Public Cert (Keystore Importable): config/ca/root_public.der"
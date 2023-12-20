set -x -e

if [[ "$USE_HTTPS" == "true" ]]; then
  echo "Generating ssl certs for server"
  mkdir -p /etc/ssl/private/
  openssl req -x509 -nodes -newkey rsa:4096 -days 1825 -nodes \
    -subj "/CN=nginx-proxy" \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt
fi

echo "Rendering out server config file"
limpet /etc/nginx/conf.d/server.conf.liquid /etc/nginx/conf.d/server.conf

cat /etc/nginx/conf.d/server.conf

set +x +e

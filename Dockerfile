FROM nginx:alpine

ENV PORT=5000
ENV USE_HTTPS="false"
ENV BASE_URL=localhost
ENV ALLOWED_PATHS="*"

# install openssl for generating self-signed certs
RUN apk update && \
      apk add openssl && \
      rm -rf /var/cache/apk/*

# install limpet for templating
RUN curl -L 'https://github.com/Journera/limpet/releases/download/0.3.0/limpet_0.3.0_linux_amd64.zip' -o /tmp/limpet.zip && \
      unzip /tmp/limpet.zip -d /bin && \
      rm /tmp/limpet.zip

COPY server.conf.liquid /etc/nginx/conf.d/server.conf.liquid

COPY config-server.sh /docker-entrypoint.d/config-server.envsh
RUN chmod +x /docker-entrypoint.d/config-server.envsh

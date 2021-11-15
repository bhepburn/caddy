ARG  CODE_VERSION=latest
FROM caddy:${CODE_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:${CODE_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
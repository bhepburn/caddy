FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-auth-portal \
    --with github.com/greenpau/caddy-authorize

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

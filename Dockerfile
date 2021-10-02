FROM node:current-alpine

RUN npm --no-color install -g \
    npm \
    @cloudflare/wrangler \
 && echo "Install complete..." \
 && echo "node $(node --version)" \
 && echo "npm  v$(npm --version)"

WORKDIR /worker

ENTRYPOINT [ "/usr/local/bin/wrangler" ]

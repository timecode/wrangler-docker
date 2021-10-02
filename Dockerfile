ARG NODE_VERSION
FROM node:$NODE_VERSION-alpine

ARG WRANGLER_VERSION
RUN echo "Installing wrangler v${WRANGLER_VERSION}"

RUN npm --no-color install -g npm \
 && npm --no-color install -g @cloudflare/wrangler@"${WRANGLER_VERSION}" \
 && echo "Install complete..." \
 && echo "node $(node --version)" \
 && echo "npm  v$(npm --version)" \
 && echo "$(wrangler --version)"

COPY build/wranglerjs "/root/.cache/.wrangler/wranglerjs-${WRANGLER_VERSION}"

RUN cd "/root/.cache/.wrangler/wranglerjs-${WRANGLER_VERSION}" \
 && npm install

WORKDIR /worker

ENTRYPOINT [ "/usr/local/bin/wrangler" ]

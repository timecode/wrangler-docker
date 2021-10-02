#!/bin/sh

NODE_VERSION=14.18
WRANGLER_VERSION=1.19.3

WRANGLER_URL_ROOT=https://github.com/cloudflare/wrangler/releases/download/v${WRANGLER_VERSION}/
WRANGLER_PACKAGE=wranglerjs-v${WRANGLER_VERSION}
WRANGLER_PACKAGE_EXT=.tar.gz

echo "Installing ${WRANGLER_PACKAGE}${WRANGLER_PACKAGE_EXT}"
rm -rf build/ ${WRANGLER_PACKAGE}${WRANGLER_PACKAGE_EXT}
mkdir -p build/wranglerjs
wget -qO ${WRANGLER_PACKAGE}${WRANGLER_PACKAGE_EXT} \
    ${WRANGLER_URL_ROOT}/${WRANGLER_PACKAGE}${WRANGLER_PACKAGE_EXT}
tar zxf ${WRANGLER_PACKAGE}${WRANGLER_PACKAGE_EXT} \
    --directory build/
rm -f ${WRANGLER_PACKAGE}${WRANGLER_PACKAGE_EXT}

docker build \
    --no-cache \
    --build-arg NODE_VERSION=${NODE_VERSION} \
    --build-arg WRANGLER_VERSION=${WRANGLER_VERSION} \
    --tag local/cloudflare-wrangler .

rm -rf build/

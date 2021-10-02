# Wrangler docker

Run [`wrangler`](https://github.com/cloudflare/wrangler) commands via a docker container rather than have to install it! I've found this pretty useful as Mac OS support for `wrangler` can be sketchy™.

## Build

1. Build the docker image from this repo:

   ```sh
   docker build --no-cache -t local/cloudflare-wrangler .
   ```

2. Copy this repo's `wrangler` file to somewhere in your `$PATH`:

   ```sh
   # ensure it's executable
   chmod +x wrangler

   cp wrangler /usr/local/bin/

   # OPTIONAL
   # check it's available
   which wrangler
   # -> /usr/local/bin/wrangler
   ```

## Usage

From a worker's root directory, simply use `wrangler` as normal e.g.

```sh
cd my-worker

# wrangler help
wrangler dev

# etc...
```

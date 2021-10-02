# Wrangler docker

Run [`wrangler`](https://github.com/cloudflare/wrangler) commands via a docker container rather than have to install it! I've found this pretty useful as Mac OS support for `wrangler` can be sketchy™ (specifically the `dev` subcommand).

## Build & Install

1. Build the docker image from this repo:

   ```sh
   ./build.sh
   ```

2. Copy this repo's `wrangler` file to somewhere in your `$PATH`:

   ```sh
   # ensure it's executable
   chmod +x wrangler

   cp wrangler /usr/local/bin/
   # if you don't want to mess with any other wrangler installs
   # rename this file something like wranglerdev and use that instead
   # e.g
   # cp wrangler /usr/local/bin/wranglerdev

   # OPTIONAL
   # check it's available
   which wrangler
   # -> /usr/local/bin/wrangler
   # or
   # which wranglerdev
   # -> /usr/local/bin/wranglerdev
   ```

## Usage

Ensure the worker's `wrangler.toml` file includes the following:

```toml
[dev]
ip = "0.0.0.0"
port = 8787
local_protocol="http"
upstream_protocol="https"
```

From the worker's root directory, simply use `wrangler` as normal e.g.

```sh
cd my-worker

# wrangler help
wrangler dev
# or wranglerdev dev

# etc...
```

# docker-nginx-proxy

a simple docker container that runs nginx as a reverse proxy, configured using environment variables

## Environment variables

- `PORT` (default: `5000`): specify the port the proxy should run on
- `BASE_URL` (default: `localhost`): specify the base url for the proxy (ex. `https://google.com`)
- `USE_HTTPS` (default: `"false"`): specify if nginx should use ssl/https, if set to `"true"`, the container will generate self-signed certs and only accept https traffic
- `ALLOWED_PATHS`: (default: `"*"`): limit the proxy only to specific path prefixes. For example, if set to `"foo/,bar/"` nginx will accept requests to `/foo`, `/foo/sublevel`, `/bar/`, and `/bar/sublevel` (and so on), but will return a 404 to requests of `/bazz` or anything that doesn't start with `foo/` or `bar/`. Using `"*"` will proxy all requests.

# Deploy Lowkey Backend

## Automate Deployment

1. Create a file `deploy-$(hostname).sh` with node-specific instructions
2. Link `deploy.sh` to `~/deploy.sh`

`sudo ln -s $(pwd)/deploy.sh ~/deploy.sh`

### Manually Deploy Backend

Just use the `docker-compose.yaml` file provided by this repository.
To start all the components, run

``` sh
docker compose --profile all pull # optional, updates components
docker compose --profile all up -d
```

## SSL

Currently not in use

To enable SSL, use `nginx` as a reverse proxy.

1. Link `solarminer-api.conf` to `/etc/nginx/conf.d/solarminer-api.conf`

`sudo ln -s $(pwd)/solarminer-api.conf /etc/nginx/conf.d/solarminer-api.conf`

2. Reload the config with `sudo nginx -t`
3. Restart `nginx` with `sudo systemctl restart nginx`

### Certificates

#### Obtain

``` sh
sudo certbot -d '*.energiesandsuch.com' --manual certonly
```

#### Renew

``` sh
sudo certbot renew
```


# gcp-sql-proxy
[Google Cloud Platform SQL Proxy](https://github.com/GoogleCloudPlatform/cloud-sql-proxy) extension

## Why

When working with GCP SQL Proxy, it is a burden to keep configuration for
different connections easily. This extension allows to define multiple
connections available to easy pick up. e.g.

having:
```ini
# $HOME/.config/gcp-sql-proxy/conf.ini
[development]
instances=xxx:xxx:xxx=tcp:15432
```

we can run
```bash
gcp-sql-proxy development
```

Above command will match the ini section by name and apply all arguments
defined. It translates to
```bash
cloud_sql_proxy -instances=xxx:xxx:xxx=tcp:15432
```

Since all args of `cloud_sql_proxy` are prefixed with a single dash, the
extension appends the slash to all parameters defined in the `conf.ini` section.

## Systemd unit support

The extension provides systemd unit template called `gcp-sql-proxy`.

Having a `conf.ini` defined, we can run a proxy as a systemd unit. And launch
several units as well. For example:
```ini
# $HOME/.config/gcp-sql-proxy/conf.ini
[development]
instances=xxx:xxx:xxx=tcp:15432

[production]
instances=yyy:yyy:yyy=tcp:25432
```
we can enable and start systemd units
```bash
> systemctl --user enable --now gcp-sql-proxy@production
> systemctl --user enable --now gcp-sql-proxy@development
```
Now, we have two units up and running in the background. Each attach GCP SQL
Proxy to a defined port:

- `production` on port `2543`
- `development` on port `1543`


## Install
The instalation is for now managed by GNU Stow, so **GNU Stow is required**.

```bash
> make all
```

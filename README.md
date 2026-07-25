# Toxiproxy

Toxiproxy is a framework for simulating network conditions. It's made specifically to work in testing, CI and development environments, supporting deterministic tampering with connections, but with support for randomized chaos and customization. Toxiproxy is the tool you need to prove with tests that your application doesn't have single points of failure.

github.com/Shopify/toxiproxy

<img src="https://camo.githubusercontent.com/0529c4e7ec6f9842799a9150ba22a45318b533ca267c0ee12df8356a643f9d90/687474703a2f2f692e696d6775722e636f6d2f734f614e77306f2e706e67" width="30%" height="auto" alt="Toxiproxy logo">

## How to use this Makejail

```console
$ # Server
$ appjail oci run -Pd \
    -o overwrite=force \
    -o virtualnet=":<random> default" \
    -o nat \
    ghcr.io/appjail-makejails/toxiproxy toxiproxy
$ # Client
$ appjail oci run \
    -o overwrite=force \
    -o alias \
    -o ip4_inherit \
    -o ephemeral \
    ghcr.io/appjail-makejails/toxiproxy toxiproxy-cli \
    toxiproxy-cli --host http://toxiproxy:8474 list
```

### Arguments (stage: build)

* `toxiproxy_from` (default: `ghcr.io/appjail-makejails/toxiproxy`): Location of OCI image. See also [OCI Configuration](#oci-configuration).
* `toxiproxy_tag` (default: `latest`): OCI image tag. See also [OCI Configuration](#oci-configuration).

### Environment (OCI image)

* `PGID` (default: `1000`): Equivalent to `PUID` but for the Process Group ID.
* `PUID` (default: `1000`): Process User ID for the container's main process, allowing you to match the owner of files written to mounted host volumes to your host system's user. Writable volumes are changed based on this environment variable.

## OCI Configuration

```yaml
build:
  variants:
    - tag: 15.1
      containerfile: Containerfile
      aliases: ["latest"]
      default: true
      args:
        FREEBSD_RELEASE: "15.1"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
```

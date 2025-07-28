# Toxiproxy

Toxiproxy is a framework for simulating network conditions. It's made specifically to work in testing, CI and development environments, supporting deterministic tampering with connections, but with support for randomized chaos and customization. Toxiproxy is the tool you need to prove with tests that your application doesn't have single points of failure.

github.com/Shopify/toxiproxy

<img src="https://camo.githubusercontent.com/d1540f6bdeef0090439d924a09d1493cda68eb3d54d659f4cbc1b1c53ac7879e/687474703a2f2f692e696d6775722e636f6d2f734f614e77306f2e706e67" alt="toxiproxy logo" width="60%" height="auto">

## How to use this Makejail

```sh
appjail makejail \
    -j toxiproxy \
    -f gh+AppJail-makejails/toxiproxy \
    -o virtualnet=":<random> default" \
    -o nat \
    -- \
    --toxiproxy_config /path/to/your/config
appjail start toxiproxy
```

### Arguments

* `toxiproxy_ajspec` (default: `gh+AppJail-makejails/toxiproxy`): Entry point where the `appjail-ajspec(5)` file is located.
* `toxiproxy_config` (optional): Copy a Toxiproxy configuration file.
* `toxiproxy_tag` (default: `13.5`): see [#tags](#tags).

## Tags

| Tag           | Arch    | Version            | Type   |
| ------------- | --------| ------------------ | ------ |
| `13.5`    | `amd64` | `13.5-RELEASE` | `thin` |
| `14.3`    | `amd64` | `14.3-RELEASE` | `thin` |

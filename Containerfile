ARG FREEBSD_RELEASE

FROM ghcr.io/appjail-makejails/core:${FREEBSD_RELEASE}

ARG NO_PKGCLEAN

LABEL org.opencontainers.image.title="Toxiproxy" \
    org.opencontainers.image.description="TCP proxy to simulate network and system conditions" \
    org.opencontainers.image.source="https://github.com/AppJail-makejails/toxiproxy" \
    org.opencontainers.image.url="https://github.com/AppJail-makejails/toxiproxy" \
    org.opencontainers.image.vendor="DtxdF" \
    org.opencontainers.image.authors="Jesús Daniel Colmenares Oviedo <dtxdf@disroot.org>"

RUN set -xe; \
    \
    pkg update; \
    pkg install toxiproxy-server toxiproxy-cli; \
    \
    if [ -z "${NO_PKGCLEAN}" ]; then \
        pkg clean -a; \
        rm -rf /var/cache/pkg/*; \
    fi; \
    rm -rf /var/db/pkg/repos/*

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["-host=0.0.0.0"]

ENV LOG_LEVEL=info

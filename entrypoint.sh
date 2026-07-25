#!/bin/sh

. /lib.subr

set -e

create_user

case "$1" in
    -*)
        set -- su-exec noroot toxiproxy-server "$@"
        ;;
    toxiproxy-*)
        set -- su-exec noroot "$@"
        ;;
esac

exec "$@"

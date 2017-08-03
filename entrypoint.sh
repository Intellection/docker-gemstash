#!/bin/sh

set -e

# Drop root privileges if we are running gemstash as root.
if [ "$1" = "gemstash" ] && [ "$(id -u)" = "0" ]; then
    # Change the ownership of user-mutable directories to gemstash
    chown -R "${GEMSTASH_USER}:${GEMSTASH_USER}" "${GEMSTASH_HOME}/data"

    # Run gemstash as gemstash user
    command="tini -- ${*} --config-file=${GEMSTASH_HOME}/app/config.yml.erb"
    set -- su-exec "${GEMSTASH_USER}" ${command}
fi

# As argument is not related to gemstash, then assume that user wants to run his
# own process.
exec "$@"

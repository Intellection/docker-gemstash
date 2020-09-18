#!/bin/sh

set -e

# Always run this as gemstash user.
if [ "$1" = "bundle" ] && [ "$2" = "exec" ] && [ "$3" = "gemstash" ]; then
    # Change the ownership of user-mutable directories to gemstash
    chown -R "${GEMSTASH_USER}:${GEMSTASH_USER}" "${GEMSTASH_HOME}/data"

    # Specify config to be used by gemstash.
    command="tini -- ${*} --config-file=${GEMSTASH_HOME}/app/config.yml.erb"
    # Run gemstash as gemstash user
    set -- su-exec "${GEMSTASH_USER}" ${command}
fi

# As argument is not related to gemstash, then assume that user wants to run his
# own process.
exec "$@"

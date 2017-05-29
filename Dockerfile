FROM ruby:2.4.1-alpine

ENV RUNTIME_PACKAGES="tini" \
    BUILD_PACKAGES="build-base sqlite-dev" \
    GEMSTASH_VERSION="1.0.4"

RUN apk update && \
    apk add ${BUILD_PACKAGES} ${RUNTIME_PACKAGES} && \
    echo "gem: --no-ri --no-rdoc" > /root/.gemrc && \
    gem install gemstash -v ${GEMSTASH_VERSION} && \
    apk del ${BUILD_PACKAGES} && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["tini", "--"]

EXPOSE 9292

CMD [ "gemstash", "start", "--no-daemonize"]

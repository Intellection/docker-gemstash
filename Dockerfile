FROM ruby:2.4.1-alpine

ENV GEMSTASH_VERSION="1.1.0"
RUN apk --update add tini && \
    apk --update add --virtual "build-dependencies" \
      build-base \
      sqlite-dev && \
    echo "gem: --no-ri --no-rdoc" > /root/.gemrc && \
    gem install gemstash -v "${GEMSTASH_VERSION}" && \
    apk del "build-dependencies" && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["tini", "--"]

EXPOSE 9292

CMD [ "gemstash", "start", "--no-daemonize"]

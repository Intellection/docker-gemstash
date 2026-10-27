FROM ruby:3.4.12-alpine

# Install system dependencies
RUN apk add --no-cache \
      build-base \
      mariadb-dev \
      postgresql-dev \
      sqlite-dev \
      tini \
      yaml-dev && \
    gem install bundler:4.0.23

# Create gemstash user
ENV GEMSTASH_USER="gemstash"
ENV GEMSTASH_HOME="/home/${GEMSTASH_USER}"
RUN addgroup -g "9999" "${GEMSTASH_USER}" && \
    adduser -S -D -u "9999" -G "${GEMSTASH_USER}" "${GEMSTASH_USER}"

# Install Gemstash
RUN mkdir -p "${GEMSTASH_HOME}/app"
WORKDIR "${GEMSTASH_HOME}/app"
COPY "app/" "${GEMSTASH_HOME}/app"
ENV BUNDLE_FROZEN="true"
RUN bundle install --jobs 4 --retry 3

RUN mkdir -p "${GEMSTASH_HOME}/data" && \
    chown "${GEMSTASH_USER}:${GEMSTASH_USER}" "${GEMSTASH_HOME}/data"
VOLUME "${GEMSTASH_HOME}/data"

EXPOSE 9292
USER ${GEMSTASH_USER}:${GEMSTASH_USER}
ENTRYPOINT ["tini", "--"]
CMD ["bundle", "exec", "gemstash", "start", "--config-file=config.yml.erb"]

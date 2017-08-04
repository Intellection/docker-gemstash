# docker-gemstash

A RubyGems.org cache and private gem server.

## Usage

### Basic

```
$ docker run \
  --publish=9292:9292 \
  zappi/gemstash:<VERSION>
```

### Advanced

#### MySQL

See `docker-compose.mysql.yml` for an example of how to use MySQL. To run:

```
$ export COMPOSE_FILE="docker-compose.mysql.yml"
$ docker-compose up -d
$ docker-compose ps
          Name                         Command               State           Ports
-------------------------------------------------------------------------------------------
dockergemstash_gemstash_1   /entrypoint.sh gemstash st ...   Up      0.0.0.0:9292->9292/tcp
dockergemstash_mysql_1      docker-entrypoint.sh mysqld      Up      3306/tcp
```

#### PostgreSQL

See `docker-compose.postgres.yml` for an example of how to use PostgreSQL. To run:

```
$ export COMPOSE_FILE="docker-compose.postgres.yml"
$ docker-compose up -d
$ docker-compose ps
          Name                         Command               State           Ports
-------------------------------------------------------------------------------------------
dockergemstash_gemstash_1   /entrypoint.sh gemstash st ...   Up      0.0.0.0:9292->9292/tcp
dockergemstash_postgres_1   docker-entrypoint.sh postgres    Up      5432/tcp
```

# Changelog

## 2.0.0

* Upgrade Ruby from v2.6.3 to v3.4.
* Upgrade Gemstash from v2.0.0 to v2.8.0.
* Upgrade pg gem from v0.18.4 to v1.6.3.
* Upgrade mysql2 gem from v0.5.2 to v0.5.7.
* Upgrade puma from v3.12.6 to v7.2.0.
* Upgrade all transitive dependencies (activesupport 8.1, sinatra 4.2, rack 3.2, etc.).
* Upgrade MySQL image from v5.7.19 to v8.0.
* Upgrade PostgreSQL image from v9.6.3 to v16.
* Fix PostgreSQL volume mount path (was incorrectly set to /var/lib/mysql).
* Remove deprecated docker-compose version key.
* Remove deprecated links directive from compose files.

## 1.4.1

* Bump puma from 3.12.1 to 3.12.6.
* Bump rack from 2.0.7 to 2.2.3.
* Bump activesupport from 5.2.3 to 5.2.4.4.

## 1.4.0

* Always specify the config file in the command and always run as gemstash user.

## 1.3.0

* Add `GEMSTASH_PROTECTED_FETCH` configuration option to enable protected
  fetches which is disabled by default.

## 1.2.0

* Upgrade Ruby to v2.6.3.
* Upgrade Gemstash to v2.0.0.

## 1.1.0

### 2018-02-23

* Upgrade to Ruby 2.5.0.
* Default `:puma_threads` to 16 if not specified by the `GEMSTASH_PUMA_THREADS` environment variable.

### 2017-08-10

* Package gemstash v1.1.0.
* Install system libraries for all database drivers i.e. postgresql, mysql2.
* Define Ruby dependencies via `Gemfile.lock`.
* Run gemstash as `gemstash` user instead of `root`.
* Add dynamic configuration with MySQL, PostgreSQL and SQLite support.

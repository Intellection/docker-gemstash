# Changelog

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

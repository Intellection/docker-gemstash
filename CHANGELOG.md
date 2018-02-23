# Changelog

## 1.2.0

* Upgrade to Ruby 2.5.0.
* Default `:puma_threads` to 16 if not specified by the `GEMSTASH_PUMA_THREADS` environment variable.

## 1.1.0

* Package gemstash v1.1.0.
* Install system libraries for all database drivers i.e. postgresql, mysql2.
* Define Ruby dependencies via `Gemfile.lock`.
* Run gemstash as `gemstash` user instead of `root`.
* Add dynamic configuration with MySQL, PostgreSQL and SQLite support.

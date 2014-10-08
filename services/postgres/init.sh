#!/usr/bin/env bash
set -e

if [ ! -e `eval echo $postgresDataDir`"/PG_VERSION" ]; then
  $postgresql/bin/initdb -D `eval echo $postgresDataDir`
fi
exec $postgresql/bin/pg_ctl -D `eval echo $postgresDataDir` -o "-c config_file=$postgresConfigFile `eval echo $postgresFlags`" $@


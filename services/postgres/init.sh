#!/usr/bin/env bash
set -e

if [ ! -e `eval echo $postgresDataDir`"/PG_VERSION" ]; then
  $postgresql/bin/initdb -D `eval echo $postgresDataDir`
fi
$postgresql/bin/pg_ctl -D `eval echo $postgresDataDir` -o "-c config_file=$postgresConfigFile -c external_pid_file=`eval echo $postgresPidFile` `eval echo $postgresFlags`" $@


#!/usr/bin/env bash
set -e

exec $nginx/bin/nginx -c `eval echo $nginxConfigFile` `eval echo $nginxExtraFlags` $@
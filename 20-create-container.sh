#!/usr/bin/env bash

dir="$( cd "$( dirname "$0" )" && pwd )"
. $dir/00-config.conf
. $dir/../docker-web-srv/00-helper.sh

create_container
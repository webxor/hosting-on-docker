#!/usr/bin/env bash

dir="$( cd "$( dirname "$0" )" && pwd )"

. $dir/00-config.conf
. $dir/00-helper.sh

create_disk $fs_path $size_mb
format_disk $fs_path
mount_disk $fs_path $mount_path
#auto_mount $fs_path $mount_path




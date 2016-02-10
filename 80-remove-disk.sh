#!/usr/bin/env bash

dir="$( cd "$( dirname "$0" )" && pwd )"

. $dir/00-config.conf
. $dir/00-helper.sh

umount_disk $mount_path
remove_disk $fs_path
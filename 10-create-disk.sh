#!/usr/bin/env bash

##	Disk size in Mb
size_mb=512

host_path="$( cd "$( dirname "$0" )" && pwd )"

##	Path to host disk
fs_path=$host_path/disk.fs

##	Mount point path
mount_path=$host_path/disk


create_disk () {
	echo "START: Create disk $1 with size: $2 Mb"
	dd if=/dev/zero of=$1 bs=1024 count=$(($2*1024))
	echo "DONE: Create disk"
}

format_disk () {
	echo "START: Format disk $1"
	yes "yes" | mkfs.ext3 $1
	echo "DONE: Format disk"
}

mount_disk () {
	echo "START: Mount disk $1 to $2"
	mkdir -p $2
	mount -o loop $1 $2
	echo "DONE: Mount disk"
}

function auto_mount {
	if ! grep -q "$1 $2" /etc/fstab; then
		echo "$1 $2 ext3 loop 1 2" >> /etc/fstab
	fi
}

create_disk $fs_path $size_mb
format_disk $fs_path
mount_disk $fs_path $mount_path
#auto_mount $fs_path $mount_path




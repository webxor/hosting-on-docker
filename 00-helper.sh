#!/usr/bin/env bash

##	Function for creating disk
##
##	Params:
##	$1	$fs_path
##	$2	$size_mb
##
create_disk () {
	echo "START: Create disk $1 with size: $2 Mb"
	dd if=/dev/zero of=$1 bs=1024 count=$(($2*1024))
	echo "DONE: Create disk"
}

##	Function for formatting disk
##
##	Params:
##	$1	$fs_path
##
format_disk () {
	echo "START: Format disk $1"
	yes "yes" | mkfs.ext3 $1
	echo "DONE: Format disk"
}

##	Function for mounting disk
##
##	Params:
##	$1	$fs_path
##	$2	$mount_path
##
mount_disk () {
	echo "START: Mount disk $1 to $2"
	mkdir -p $2
	mount -o loop $1 $2
	echo "DONE: Mount disk"
}

##	Function for auto mounting disk after reboot
##
##	Params:
##	$1	$fs_path
##	$2	$mount_path
##
auto_mount () {
	if ! grep -q "$1 $2" /etc/fstab; then
		echo "$1 $2 ext3 loop 1 2" >> /etc/fstab
	fi
}

##	Function for umounting disk
##
##	Params:
##	$1	$mount_path
##
umount_disk () {
	echo "START: Umount disk $1"
	umount $1
	rm -r $1
	echo "DONE: Umount disk $1"
}

##	Function for removing disk
##
##	Params:
##	$1	$fs_path
##
remove_disk () {
	echo "START: Remove disk $1"
	rm $1
	echo "DONE: Remove disk $1"
}
#!/bin/bash
set -exv
DEFCONFIG="lineageos_oneplus3_defconfig"
arch="arm64"
make ARCH=$arch $DEFCONFIG
make ARCH=$arch savedefconfig
d=0;
for i in $(sha512sum defconfig)
do

	if [ $d -eq 0 ]
	then
		configsha=$i
		d=$(($d+1))
	fi

done
d=0;
for i in $(sha512sum arch/$arch/configs/$DEFCONFIG)
do

	if [ $d -eq 0 ]
	then
		defconfigsha=$i
		d=$(($d+1))
	fi

done

if [ "$configsha" == "$defconfigsha" ]
then

	make distclean
	exit 0

else

	exit 1

fi

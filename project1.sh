#!bin/bash

set -e

OS_type=
kernel_version=
hostname=
free_disk=
free_RAM=
uptime=
user=
home_dir=

if command -v uname  &> /dev/null ; then
	OS_type=$(uname)
	kernel_version=$(uname -r)
	
else
	echo "command does not exist" 
	exit 1

fi

if command -v hostname &> /dev/null ; then
        hostname=$(hostname)
        
else
        echo "command does not exist"
	exit 1
fi

if command -v free &> /dev/null ; then
        free_RAM=$(free -h | awk '/Mem:/ {print$7}' )

else
        echo "command does not exist"
        exit 1
fi


if command -v df &> /dev/null ; then
        free_disk=$(df -h)

else
        echo "command does not exist"
        exit 1
fi


if command -v pwd &> /dev/null ; then
        home_dir=$(pwd)

else
        echo "command does not exist"
        exit 1
fi


if command -v whoami &> /dev/null ; then
        user=$(whoami)

else
        echo "command does not exist"
        exit 1
fi


echo -e  "the type of the operatin system is $OS_type \n the kernel version is $kernel_version \n the available memory is $free_RAM \n the available storage is \n $free_disk \n the current user is $user \n the home directory of the current user is $home_dir"


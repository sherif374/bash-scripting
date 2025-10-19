#!bin/bash
set -e
read -p "source directory:" src_dir
read -p "destination directory:" dest_dir

if [ ! -d "$src_dir" ] ; then
	
        echo " '$src_dir' does not exist"  
	exit 1
fi

if [ ! -d "$dest_dir" ] ; then
        
        echo " '$dest_dir' does not exist ... crating it now"

        if  ! mkdir -p "$dest_dir"  ; then
         
           echo " could not create destination directory"
           exit 1
       
        fi
fi

timestamp=$(date +%F-%H:%M:%S)
backup_file="backup_${timestamp}.tar.gz"

tar -czf "$dest_dir/$backup_file" "$src_dir" 

if [ $? -eq 0 ]; then
	echo "backup_successful"
else
	echo "backup failed"
fi

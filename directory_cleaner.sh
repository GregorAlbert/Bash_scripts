#!/bin/bash

#CHANGEABLE VARIABLES
	#Path to directory where files must be deleted (e.g. /home/dir1/subdir3 )
path=/home/
	#Files older than $days will be deleted
days=7
	#File types with in $file_types will be removed
file_types=(xls pdf txt)
#

limit_time=`date +%s -d "-$days days"`
FILES=$path/*

for file in $FILES ; do	
	for i in "${file_types[@]}" ; do
		filename=$(basename "$file")
	    if [ "${filename##*.}" == "$i" ] ; then
		    file_time=`stat -c %Z "$file"`
		    if [ $file_time -le $limit_time ] ; then
		         echo "Deleting $file"
				 rm "$file"
		    fi		
            fi
	done
done





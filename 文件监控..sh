#!/bin/bash

function read_dir(){
	for file in `ls $1`
	do
	    if [ -d $1"/"$file ]
	    then 
		read_dir $1"/"$file
	    else
		echo $1"/"$file
	    fi
	done
}

read_dir $1


#!/bin/bash

function read_dir(){
	for file in `ls $1`
	do
	    if [ -d $1"/"$file ]
	    then 
		read_dir $1"/"$file
	    else
		echo $1"/"$file >> b.txt
	    fi
	done
}

function different(){
	a=`diff ./a.txt ./b.txt |grep /var/www | cut -d " " -f 2`
	if [ -n "$a" ]
	then
	    echo "Have changed,look c.txt!!!"
	    echo $a >> c.txt
	    #rm -f $a
	fi
	cat /dev/null > b.txt
}

while [ 1 -eq 1 ]
do
	sleep 0.5
	read_dir $1
	different
done
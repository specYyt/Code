#!/bin/bash

while true
do
	ip=`netstat -an | grep "ESTA" | awk '{print $5}' | cut -d ":" -f1`
	port=netstat -ntlp | awk '{print $4}' | grep -v only,Local | cut -d ":" -f2
	#port是记录本地开放端口情况,如果感觉非法可以封端口
	portpid=`netstat -atlp|grep -v 22,3306 | awk '{print $7}' |grep -v Address| cut -d "/" -f1'`
	#portpid是记录开放情况的pid,如果不正常可以kill portpie
 	if [ -n "$ip" ];then
		echo "非法ip：" $ip
	fi
	if [ -n "$port" ];then
		echo "非法端口：" $port
	fi
	sleep 3
done
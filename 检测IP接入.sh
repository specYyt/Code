#!/bin/bash

while true
do
	ip=`netstat -an | grep "ESTA" | awk '{print $5}' | cut -d ":" -f1`
	port=netstat -ntlp | awk '{print $4}' | grep -v only,Local | cut -d ":" -f2
	#port�Ǽ�¼���ؿ��Ŷ˿����,����о��Ƿ����Է�˿�
	portpid=`netstat -atlp|grep -v 22,3306 | awk '{print $7}' |grep -v Address| cut -d "/" -f1'`
	#portpid�Ǽ�¼���������pid,�������������kill portpie
 	if [ -n "$ip" ];then
		echo "�Ƿ�ip��" $ip
	fi
	if [ -n "$port" ];then
		echo "�Ƿ��˿ڣ�" $port
	fi
	sleep 3
done
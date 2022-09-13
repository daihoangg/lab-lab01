#!/bin/bash

echo "schedule myweb"

echo "show times"
echo $(date +%T)
echo -e "=========================\n"

a="$(date +%H)"
echo "${a#0}"

if [[ (${a#0} -gt 7) && (${a#0} -lt 18) ]]; 
then
	echo "Trong gio hanh chinh"
else 
	echo "Het gio hanh chinh"
fi

b=$(docker ps -q|grep 62)
echo $b
if [[ "$b" != "62d73cf95880" ]]; 
then 
	echo "Now, myweb is down"
#	docker start 62d73cf95880
	echo "myweb is up"
else
	echo "myweb is running" 
fi
echo "end"

echo -e "==========================\n"
c=$(docker ps | sed -n 's/.*\(myweb\).*/\1/p')
echo $c

if [[ (${a#0} -gt 2) && (${a#0} -lt 18) ]];
then
	echo "Trong gio hanh chinh"
	if [[ -n "$c" ]];
	then
		echo "myweb is running"
	else
		echo "Now, myweb is down"
#		docker start myweb
		echo "myweb is up"
	fi
else
	echo "Het gio hanh chinh"
fi


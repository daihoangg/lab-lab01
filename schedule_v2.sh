#!/bin/bash

echo "schedule myweb"

echo "show times"
echo $(date +%T)
echo -e "=========================\n"

a="$(date +%H)"
echo "${a#0}"

echo -e "==========================\n"
c=$(docker ps | sed -n 's/.*\(myweb\).*/\1/p')
echo $c

if [[ (${a#0} -gt 8) && (${a#0} -lt 18) ]];
then
	echo "Trong gio hanh chinh"
	if [[ -n "$c" ]];
	then
		echo "myweb is running"
	else
		echo "Now, myweb is down"
		docker start myweb
		echo "myweb is up"
	fi
else
	echo "Het gio hanh chinh"
fi


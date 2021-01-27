#!/bin/bash

# How to use it?
if [ "$1" != 401 ] && [ "$1" != 403 ]
then
	echo "Usage: cat <urls.txt> | ./scfinder.sh <status code>"
	echo ""
	echo "Params:"
	echo "   <urls.txt>: one url per line"
	echo "   <status code>: 401 (unauthorized) or 403 (forbidden)"
	echo ""
	echo "Example: cat subs.txt | ./scfinder.sh 401"
	echo ""
	echo "by @marcosdell"
	exit
fi

# There we go
STATUS_CODE=$1

while read url 
do 
	result=$(curl -L -s -m 1 -o /dev/null -w "%{http_code}" $url)

	if [ $result == $STATUS_CODE ]
	then
		echo $url
	fi	
done

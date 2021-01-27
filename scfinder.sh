#!/bin/bash

# How to use it?
if [ "$#" -eq 0 ] || [ "$1" == "-h" ]
then
	echo "Usage: cat <urls> | ./scfinder.sh <status code>"
	echo ""
	echo "Params:"
	echo "   <urls>: one url per line"
	echo "   <status code>: 401 (unauthorized), 403 (forbidden), or ...?"
	echo ""
	echo "Example: cat subs.txt | ./scfinder.sh 403"
	echo ""
	echo "by @marcosdell"
	exit
fi

# There we go
STATUS_CODE=$1

while read url 
do 
	result=$(curl -L -s -m 1 -o /dev/null -w "%{http_code}" $url)

	if [ $result -eq $STATUS_CODE ]
	then
		echo $url
	fi	
done

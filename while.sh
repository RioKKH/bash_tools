#!/bin/bash

RETRY_MAX=10
cnt=0

while [ $cnt -le ${RETRY_MAX} ]; do
	echo ${cnt}
	cnt=$(expr ${cnt} + 1)
done

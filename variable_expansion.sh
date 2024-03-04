#!/bin/bash

ADIR="/home/test"
NOADIR="/home/test"

alist=$(ls ${ADIR})
noalist=$(ls ${NOADIR})

command=echo

ancmd()
{
	local -r fin=$1
	local gzipped=false

	if [[ ${fin} =~ \.png$ ]]; then
		filename="${fin}"
		filename_wo_extension="${fin%.*}"
		extension=${fin##*.}
	elif [[ ${fin} =~ \.png\.gz$ ]]; then
		gunzip "${fin}"
		gzipped=true
		filename="${fin%.*}"
		filename_wo_extension="${filename%.*}"
		extension=${filename##*.}
	else
		return 0
	fi

	csvfile=${filename_wo_extension}".csv"
	coeffile=${filename_wo_extension}"_coef.csv"

	start=$(date +%Y/%m/%d-%H:%M:%S.%3N)
	${command} "${filename}" "${csvfile}" "${coeffile}"
	ret=$?
	end=$(date +%Y/%m/%d-%H:%M:%S.%3N)
	printf "%s,%s,%s,%d\n" "${filename}" "${start}" "${end}" "${ret}"

	if [[ ${gzipped} ]]; then
		gzip "${filename}" &
	fi
}

echo "### MARK ###"
for fin in ${alist}; do
	ancmd "${ADIR}/${fin}"
done

echo "### NOMARK ###"
for fin in ${noalist}; do
	ancmd "${NOADIR}/${fin}"
done

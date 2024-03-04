#!/bin/bash

MARKDIR=$(pwd + "/work")
NOMARKDIR=$(pwd + "/work2")

marklist=$(ls "${MARKDIR}")
nomarklist=$(ls "${NOMARKDIR}")

ancmd()
{
	local -r fin=$1
	local gzipped=false

	if [[ ${fin} =~ \.pgm$ ]]; then
		filename="${fin}"
		filename_wo_extension="${fin%.*}"
		extension=${fin##*.}
	elif [[ ${fin} =~ \.pgm\.gz$ ]]; then
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
	# analyze_command_here #
	ret=$?
	end=$(date +%Y/%m/%d-%H:%M:%S.%3N)
	printf "%s,%s,%s,%d\n" "${filename}" "${start}" "${end}" "${ret}"

	if [[ ${gzipped} ]]; then
		gzip "${filename}" &
	fi
}

echo "### MARK ###"
for fin in ${marklist}; do
	ancmd "${MARKDIR}/${fin}"
done

echo "### NOMARK ###"
for fin in ${nomarklist}; do
	ancmd "${NOMARKDIR}/${fin}"
done

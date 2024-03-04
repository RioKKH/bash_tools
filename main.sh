#!/bin/bash

function run()
{
	return 1
}

run
[[ $? -ne 0 ]] && echo "NG"

run; res=$?
[[ ${res} -eq 0 ]] && echo "OK: ${res}"
[[ ${res} -ne 0 ]] && echo "NG: ${res}"

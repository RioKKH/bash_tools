#!/bin/bash

ONE=1
ZERO=0

function error_handler()
{
	echo "Error: @${LINENO} in ${FUNCNAME[0]}"
}

[[ 1 -eq ${ONE} ]] && (echo "1st"; error_handler)
[[ 1 -eq ${ONE} ]] && (echo "1st"; error_handler)
[[ 1 -eq ${ONE} ]] && (echo "1st"; error_handler)


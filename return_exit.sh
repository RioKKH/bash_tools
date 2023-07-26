#!/bin/bash

function exit_by_exit()
{
	echo "line:${LINENO} @ ${FUNCNAME[0]}()"
	if   [[ $1 -eq 0 ]]; then return 0; # echo "after return 0"
	elif [[ $1 -eq 1 ]]; then return 1; # echo "after return 1"
	elif [[ $1 -eq 2 ]]; then return 2; # echo "after return 2"
	else                      return 3; # echo "after return 3"
	fi
}

exit_by_exit 3
res=$?
[[ ${res} -eq 0 ]] && echo "!!0!!"
[[ ${res} -eq 1 ]] && echo "!!1!!"
[[ ${res} -eq 2 ]] && echo "!!2!!"
[[ ${res} -eq 3 ]] && echo "!!3!!"

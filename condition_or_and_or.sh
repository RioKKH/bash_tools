#!/bin/bash

readonly CWD=$(pwd)
readonly FILEA=${CWD}/A.dat
readonly FILEB=${CWD}/B.dat

[[ ! -f ${FILEA} || ! -f ${FILEB} ]] && echo "Either FILEA or FILEB or both do not exist."
[[ ! -f ${FILEA} ]] && echo "No FILEA"
[[ ! -f ${FILEB} ]] && echo "No FILEB"
[[ -f ${FILEA}   ]] && echo "FILEA"
[[ -f ${FILEB}   ]] && echo "FILEB"

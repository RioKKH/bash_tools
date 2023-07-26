#!/bin/bash

declare -a A1=()

function local_test()
{
	local readonly aaa=0
	echo ${aaa}
}

function array()
{
	local a1=()
	A1X=10
	A1Y=20
	a1+=(${A1X} ${A1Y})
	echo ${a1[@]}
}

A1=($(array))
echo ${A1[@]}
echo ${A1[0]}
local_test

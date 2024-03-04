#!/bin/bash

test1()
{
	local a=10
	echo ${a}
	local -r a 
	a=12
	echo ${a} # a is 10 even after a=12 since this is local and readonly variable
}

X=10; readonly X
echo ${X}
X=12
echo ${X} # X is 10 even after X=12 since this is readonly variable

test1

#!/bin/bash

RAISE()
{
	echo "Raise exception @ ${1}"
	exit 1
}

func1()
{
	return 0
}

func2()
{
	return 1
}

func3()
{
	a=(1 2 3)
	echo "${a[@]}"
	return 0
}

# main
(
# Try ----------------------------
	read -r -a aaa <<< "$(func3)"
	echo "${aaa[0]}"
	echo "${aaa[1]}"
	echo "${aaa[2]}"
	func1 || RAISE "${LINENO}"
	func2 || RAISE "${LINENO}"
) ||
# Catch --------------------------
(
	echo "Catched"
	exit 1
)
	

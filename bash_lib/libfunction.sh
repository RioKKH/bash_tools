#!/bin/bash

export AAA=10

aaa()
{
	echo "Function aaa"
}

bbb()
{
	echo "Function bbb"
}

ccc()
{
	echo "Function ccc"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	echo "This is main part"
else
	echo "This is lib part"
fi

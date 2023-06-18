#!/bin/bash

# 拡張子をPNGからJPGに変換するBashスクリプト

folder=$(pwd)

before=".jpg"
after=".png"
#before=".png"
#after=".jpg"
files=$(find "${folder}" -name "*${before}")

for file in ${files}; do
	mv "${file}" "${file/${before}/${after}}"
done



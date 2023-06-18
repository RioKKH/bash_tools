#!/bin/bash

convert_png_to_jpg()
{
	src_dir=$1
	if [[ ! -d ${src_dir} ]]; then
		mkdir "${src_dir}"
	fi

	dst_dir=$2
	if [[ ! -d ${dst_dir} ]]; then
		mkdir "${src_dir}"
	fi

	for png_file in "${src_dir}"/*.png; do
		# 変換後のファイル名を作成する
		# ドット(.)に続く任意の文字列を除去した文字列を返す
		# ファイル名の拡張子を削除するときによく使われるパターン
		jpg_file="${png_file%.*}.jpg"

		# PNGからJPGに変換する
		convert "${png_file}" "${dst_dir/$jpg_file}"

		echo "変換完了: ${png_file} -> ${dst_dir}/${jpg_file}"
	done
}


convert_png_to_jpg "$1" "$2"

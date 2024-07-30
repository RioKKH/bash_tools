#!/bin/bash
#
# 現在のディレクトリ内のIMG_*.PNGファイルを検索する
for file in IMG_*PNG; do
	# ファイルが存在するか確認する
	if [[ -f $file ]]; then
		# 新しいファイル名を作成する (拡張子を変更)
		# %: 一致する最短のパターンを削除
		newfile="${file%.PNG}.JPG"

		# ファイル名を変更する
		mv "${file}" "${newfile}"

		echo "Renamed: ${file} -> ${newfile}"
	fi
done

echo "Renaming complete."

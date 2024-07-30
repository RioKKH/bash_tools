#!/bin/bash

# ImageMagickがインストールされているかを確認する
if ! command -v convert &> /dev/null; then
	echo "ImageMagickがインストールされていません。"
	exit 1
fi

# トリミングするピクセル数を指定する
# これらの値は必要に応じて調整する
TOP_CROP=250
BOTTOM_CROP=100
LEFT_CROP=100
RIGHT_CROP=50

# JPGファイルを検索してトリミングする
for file in *.JPG; do
	if [[ -f "${file}" ]]; then
		output="${file%.*}_cropped.jpg"

		# 画像の元のサイズを取得する
		size=$(identify -format "%wx%h" "${file}")
		width=$(echo "${size}" | cut -d'x' -f1)
		height=$(echo "${size}" | cut -d'x' -f2)

		# 新しい画像サイズを計算する
		new_width=$((width - LEFT_CROP - RIGHT_CROP))
		new_height=$((height - TOP_CROP - BOTTOM_CROP))

		# トリミングを実行する
		convert "${file}" -crop "${new_width}x${new_height}+${LEFT_CROP}+${TOP_CROP}" "${output}"
		echo "Cropped: ${file} -> ${output}"
	fi
done


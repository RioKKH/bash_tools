#!/bin/bash

rotate_90degrees_CW()
{
	local -r PNGLIST=$(ls ./*png)

	for png in ${PNGLIST}; do
		filename=$(basename "${png}" .png)
		convert -rotate 90 "${png}" "${filename}_cw90.png"
	done
}

rotate_90degrees_CCW()
{
	local -r PNGLIST=$(ls ./*png)
	for png in ${PNGLIST}; do
		filename=$(basename "${png}" .png)
		convert -rotate -90 "${png}" "${filename}_ccw90.png"
	done
}

split_horizontal()
{
	local -r PNGLIST=$(ls ./*_cw90.png)
	#local -r PNGLIST=$(ls *_ccw90.png)
	for png in ${PNGLIST}; do
		filename=$(basename "${png}" .png)
		convert -crop 50%x100% "${png}" "${filename}_hor.png"
	done
}

split_vertial()
{
	local -r PNGLIST=$(ls ./*_cw90.png)
	#local -r PNGLIST=$(ls *_ccw90.png)
	for png in ${PNGLIST}; do
		filename=$(basename "${png}" .png)
		convert -crop 100%x50% "${png}" "${filename}_ver.png"
	done
}

make_pdf()
{
	local -r PNGLIST=$(ls ./*_hor*.png)
	local -r FOUT=$1

	convert "${PNGLIST}" "${FOUT}"
}


# main -----------------------------
#rotate_90degrees_CW
#split_horizontal
make_pdf output.pdf

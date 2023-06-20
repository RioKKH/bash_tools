#!/bin/bash

rotate_90degrees_CW()
{
	local -r JPGLIST=$(ls ./*jpg)

	for jpg in ${JPGLIST}; do
		filename=$(basename ${jpg} .jpg)
		convert -rotate 90 "${jpg}" "${filename}_cw90.jpg"
	done
}

rotate_90degrees_CCW()
{
	local -r JPGLIST=$(ls ./*jpg)
	for jpg in ${JPGLIST}; do
		filename=$(basename ${jpg} .jpg)
		convert -rotate -90 "${jpg}" "${filename}_ccw90.jpg"
	done
}

split_horizontal()
{
	local -r JPGLIST=$(ls ./*_cw90.jpg)
	#local -r JPGLIST=$(ls *_ccw90.jpg)
	for jpg in ${JPGLIST}; do
		filename=$(basename "${jpg}" .jpg)
		convert -crop 50%x100% "${jpg}" "${filename}_hor.jpg"
	done
}

split_vertial()
{
	local -r JPGLIST=$(ls ./*_cw90.jpg)
	#local -r JPGLIST=$(ls *_ccw90.jpg)
	for jpg in ${JPGLIST}; do
		filename=$(basename "${jpg}" .jpg)
		convert -crop 100%x50% "${jpg}" "${filename}_ver.jpg"
	done
}

make_pdf()
{
	local -r JPGLIST=$(ls ./*_hor-[01].jpg)
	local -r FOUT=$1

	convert "${JPGLIST}" "${FOUT}"
}


# main -----------------------------
#rotate_90degrees_CW
#split_horizontal
make_pdf output.pdf

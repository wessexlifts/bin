# File:        file-extension-normalize.sh
# Author:      Julian Orchard <marketing@wessexlifts.co.uk>
# Tag Added:   2022-03-08
# Description: Clean filenames of filetype in the current folder.

# Input Extention JPG Default
[ -z $1 ] && ext=".JPG" || ext=$1

# Find Ext and MV
find . -type f -name "*${ext}" |
	while IFS= read f
	do
		mv "$f" "${f::-4}.jpg"
	done

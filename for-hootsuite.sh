#!/bin/bash

# File:        for-hootsuite.sh
# Author:      Julian Orchard <marketing@wessexlifts.co.uk>
# Tag Added:   2022-03-17
# Description: Crop and resize images in a folder to Hootsuite Social Media specifications.

function does_image_need_resizing() {
  # Image File
    image=$1
  # Split X:X Into Two Variables (d_1 and d_2)
    r=(${2//\:/ })
    d_1=${r[0]}
    d_2=${r[1]}
  # Get Current Aspect Ratio
    c_r=$(magick convert "${image}" -format "%[fx:(w/h)]" info:)
  # Check If Outside Bounds
    r_1=$(awk "BEGIN { print $d_1 / $d_2 }") # ratio of 1/2
    r_2=$(awk "BEGIN { print $d_2 / $d_1 }") # ratio of 2/1
    if awk "BEGIN {exit (${c_r} < ${r_1})}" || awk "BEGIN {exit (${c_r} > ${r_2})}"
    then
    # Returns Image Rightside Up
      awk "BEGIN {exit (${c_r} < 1)}" && echo "$d_1:$d_2" || echo "$d_2:$d_1"
    else
    # Image Does Not Need Resizing
      echo 0
    fi
}

logo="/p/Wessex Logo/Wessex-Arrow.png"
aspect_ratio_you_want="5:4"

# Loop Through .jpg Files
find . -type f -name "*.jpg" |
	while IFS= read f
	do
    # Don't Do This To Existing 'Hootsuite' Files
      [[ "$f" == *"hootsuite"* ]] && continue
      ratio=$(does_image_need_resizing ${f} ${aspect_ratio_you_want})
    # *-hootsuite.jpg format
      nf="${f::-4}-hootsuite.jpg"
    # Magick Happening
      printf "\nWriting $f "
      # Lower Quality
        magick convert -strip -interlace Plane -gaussian-blur 0.05 -quality 85% "$f" "$nf"
      printf " lowering quality "
      # Crop To 4:5 / 5:4
        [[ $ratio != 0 ]] && magick convert "$nf" -gravity center -crop "$ratio" "$nf"
      printf " cropping "
      # Add Wessex Arrows
        magick convert "$nf" "$logo" -gravity southwest -geometry +11+10 -composite "$nf"
      printf " adding watermark "
	done
  printf "\n"

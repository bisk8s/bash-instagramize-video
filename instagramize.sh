#/bin/bash

clear

INPUT_PATH=$1
FILE_NAME=$(basename -- "$1"| cut -f 1 -d '.')
FILE_EXT=$(basename -- "$1"| cut -f 2 -d '.')
OUTPUT_FILE="${FILE_NAME}_instagramized.${FILE_EXT}"

ffmpeg -i $INPUT_PATH \
       -filter_complex_script squareblured.filter\
       -y \
       $OUTPUT_FILE
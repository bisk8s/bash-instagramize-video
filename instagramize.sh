#/bin/bash

clear

VIDEO_SIZE=600
FILE_PATH=$1
FILE_NAME=$(basename -- "$1"| cut -f 1 -d '.')
OUTPUT_FILE="${FILE_NAME}_instagramized.mp4"

ffmpeg -i $1 \
    -c:v libx264 -crf 23 \
    -filter_complex "[0:v]split=2[blur][vid];[blur]scale=$VIDEO_SIZE:$VIDEO_SIZE:force_original_aspect_ratio=increase,crop=$VIDEO_SIZE:$VIDEO_SIZE,boxblur=luma_radius=min(h\,w)/20:luma_power=1:chroma_radius=min(cw\,ch)/20:chroma_power=1[bg];[vid]scale=$VIDEO_SIZE:$VIDEO_SIZE:force_original_aspect_ratio=decrease[ov];[bg][ov]overlay=(W-w)/2:(H-h)/2" \
    -profile:v baseline -level 3.0 -pix_fmt yuv420p -preset faster -tune fastdecode \
    -c:a aac -ac 2 -b:a 128k \
    -movflags faststart \
    $OUTPUT_FILE -y

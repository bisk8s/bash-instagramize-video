#/bin/bash

clear
find . -maxdepth 1 -name '*.mp4'   -type f -exec bash -c './instagramize.sh $1' _ {} \;

mkdir instagramized
mkdir originals

mv *_instagramized.mp4 ./instagramized
mv *.mp4 ./originals 
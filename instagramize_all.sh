#/bin/bash

clear
find . -maxdepth 1 -name '*.mp4'   -type f -exec bash -c './instagramize.sh $1' _ {} \;
find . -maxdepth 1 -name '*.jpg'   -type f -exec bash -c './instagramize.sh $1' _ {} \;
find . -maxdepth 1 -name '*.png'   -type f -exec bash -c './instagramize.sh $1' _ {} \;
find . -maxdepth 1 -name '*.jpeg'   -type f -exec bash -c './instagramize.sh $1' _ {} \;

mkdir instagramized
mkdir originals

mv *_instagramized.mp4 ./instagramized
mv *_instagramized.jpg ./instagramized
mv *_instagramized.png ./instagramized
mv *_instagramized.jpeg ./instagramized

mv *.mp4 ./originals 
mv *.jpg ./originals 
mv *.png ./originals 
mv *.jpeg ./originals 
#!/bin/bash

sizes="16x1 16x2 32x1 32x2 48x1 48x2 256x1 256x2";
source=${1:-oas3-800.png};
dst=${2:-.};
for s in $sizes; do
  size=${s%x*};
  scale=${s##*x};
  resize=$(bc <<< ${size}*${scale} );
convert "$source" -resize ${resize}x${resize}     -unsharp 1x4 $dst/"Icon-App-${size}x${size}@${scale}x.png";
done;

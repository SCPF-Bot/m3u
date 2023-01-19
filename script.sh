#!/bin/bash

RANDOM=$$

wget -nv --random-wait -i downloads/url.txt

mkdir -p downloads/m3u
cat downloads/* > downloads/universal.m3u
sort -u downloads/universal.m3u
mv downloads/universal.m3u downloads/m3u
rm -f *
ls downloads
ls downloads/m3u/*

#!/bin/bash

RANDOM=$$

wget -nv --random-wait -i downloads/url.txt

cat downloads/* > downloads/universal.m3u
sort -u downloads/universal.m3u

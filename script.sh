#!/bin/bash

RANDOM=$$

wget -nv --random-wait -i downloads/url.txt -O $RANDOM.txt

cat * > universal.m3u
sort -u universal.m3u

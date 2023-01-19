#!/bin/bash

RANDOM=$$

wget -nv --random-wait -i url.txt -O $RANDOM.txt

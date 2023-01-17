#!/bin/bash

URL="https://sample-videos.com/video123/mp4/240/big_buck_bunny_240p_1mb.mp4"

APILOGIN="4fnvjnFdY1Z18hZL"
APIKEY="qn9BJx6KvciyhG7d"

wget -q --random-wait $URL
LSMAIN=$(ls --ignore=*.sh)
FILENAME=$(echo "$LSMAIN")
wget -q --random-wait https://github.com/storj/storj/releases/latest/download/uplink_linux_amd64.zip
unzip -qq -o uplink_linux_amd64.zip
sudo install uplink /usr/local/bin/uplink
uplink access import main .github/workflows/accessgrant.txt
uplink cp $FILENAME sj://root/NSFW/

UPLOADURL=$(curl -s -X GET "https://api.streamlare.com/api/file/upload/generate?login=$APILOGIN&key=$APIKEY" | jq -r '.result')
HASHID=$(curl -s -k -F file=@$FILENAME -F login=$APILOGIN -F key=$APIKEY $UPLOADURL | jq -r '.result.hashid')

echo "HASH ID:
$HASHID

VIDEO LINK:
https://sltube.org/v/$HASHID"

uplink share --url --not-after=none sj://root/NSFW/$FILENAME | grep -i "link.storjshare" | cut -b 13-

#!/bin/bash

URL="https://vdownload-41.sb-cd.com/1/2/12962170-720p.mp4?secure=rl0fkL7QPXRcqVZL7xNlZw,1674043558&m=41&d=1&_tid=12962170"

APILOGIN="4fnvjnFdY1Z18hZL"
APIKEY="qn9BJx6KvciyhG7d"

DATENOW=$(date +'%Y.%m.%d')
RANDOM=$$

wget -q --random-wait $URL
mv *.mp4 $DATENOW.$RANDOM.mp4
LSMAIN=$(ls --ignore=*.sh)
FILENAME=$(echo "$LSMAIN")
wget -q --random-wait https://github.com/storj/storj/releases/latest/download/uplink_linux_amd64.zip
unzip -qq -o uplink_linux_amd64.zip
sudo install uplink /usr/local/bin/uplink
uplink access import main .github/workflows/accessgrant.txt
uplink cp $FILENAME sj://root/NSFW/$DATENOW/

UPLOADURL=$(curl -s -X GET "https://api.streamlare.com/api/file/upload/generate?login=$APILOGIN&key=$APIKEY" | jq -r '.result')
HASHID=$(curl -s -k -F file=@$FILENAME -F login=$APILOGIN -F key=$APIKEY $UPLOADURL | jq -r '.result.hashid')

echo "HASH ID:
$HASHID

VIDEO LINK:
https://sltube.org/v/$HASHID

STORJ LINK:"
uplink share --url --not-after=none sj://root/NSFW/$DATENOW/$FILENAME | grep -i "link.storjshare" | cut -b 13-

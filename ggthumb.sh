#!/bin/bash

urldecode(){
  echo -e "$(sed 'y/+/ /; s/%/\\x/g')"
}

mkdir /tmp/ggthumb
f=`echo -n $3| sed 's/file:\/\///'|urldecode`
cp "$f" /tmp/ggthumb/ggt.zip
unzip -qq /tmp/ggthumb/ggt.zip -d /tmp/ggthumb
convert -resize $2 /tmp/ggthumb/geogebra_thumbnail.png $4 2>/dev/null
echo "$3 $f $?">>/tmp/glog
rm -rf /tmp/ggthumb 

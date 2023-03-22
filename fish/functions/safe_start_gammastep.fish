#!/usr/bin/fish
# Safely start gammastep.  If we can't get the internet we just throw
# it the lat/long of Durham, unless a file (~.latlong) contains more
# up-to-date coordinates.  File should contain two decimals seperated
# by a colon.  For South/East use negatives.  Only last line of file
# will be read.

set durham 54.52:-1.55

set latlong (curl ipinfo.io | jq -j .loc | tr ',' ':')
echo "A" > /tmp/gammastepmode
if [ -z $latlong ]
    set latlong (tail -n1 "~/.latlong"; or echo $durham)
    echo "M" > /tmp/gammastepmode
end

pkill gammastep

gammastep -l $latlong &
jobs -lp > /tmp/gammastepprocess

wait

echo "Failed to start gammastep, using fallback" | tee -a /tmp/gammastep.log
echo 'F' > /tmp/gammastepmode
gammastep -l $durham -m vidmode &
jobs -lp /tmp/gammastepprocess

wait

echo "!!" > /tmp/gammastepmode

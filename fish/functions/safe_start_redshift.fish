#!/usr/bin/fish
# Safely start redshift.  If we can't get the internet we just throw
# it the lat/long of Durham, unless a file (~.latlong) contains more
# up-to-date coordinates.  File should contain two decimals seperated
# by a colon.  For South/East use negatives.  Only last line of file
# will be read.

set durham 54.52:-1.55

set latlong (curl ipinfo.io | jq -j .loc | tr ',' ':')
echo "A" > /tmp/redshiftmode
if [ -z $latlong ]
    set latlong (tail -n1 "~/.latlong"; or echo $durham)
    echo "M" > /tmp/redshiftmode
end

pkill redshift

redshift -l $latlong -m vidmode &
jobs -lp > /tmp/redshiftprocess

wait

echo "Failed to start redshift, using fallback" | tee -a /tmp/redshift.log
echo 'F' > /tmp/redshiftmode
redshift -l $durham -m vidmode &
jobs -lp /tmp/redshiftprocess

wait

echo "!!" > /tmp/redshiftmode

#!/bin/bash

status=`bash ~/.config/polybar/forest/scripts/spotify_status.sh`

if [ "$status" = "No music" ]; then
  bspc desktop -f 9 &
  spotify --force-device-scale-factor=1.75 %U &
fi
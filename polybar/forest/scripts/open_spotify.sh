#!/bin/bash

status=`bash ~/.config/polybar/forest/scripts/spotify_status.sh`

if [ "$status" = "No music" ]; then
  bspc desktop -f 9 &
  spotify &
fi
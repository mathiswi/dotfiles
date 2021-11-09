#!/bin/bash

# see man zscroll for documentation of the following parameters
zscroll -l 300 \
        --delay 0.2 \
        --scroll-padding "  " \
        --match-command "$HOME/.config/polybar/forest/scripts/spotify_status.sh --status" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true "$HOME/.config/polybar/forest/scripts/spotify_status.sh" &

wait
#!/bin/bash

# Handle controls
case "$1" in
    --toggle) playerctl play-pause; exit 0 ;;
    --next)   playerctl next; exit 0 ;;
esac

# Efficient listener outputting clean JSON
playerctl --follow metadata --format '{"status": "{{status}}", "title": "{{markup_escape(title)}}", "artist": "{{markup_escape(artist)}}", "album": "{{markup_escape(album)}}"}' 2>/dev/null | while read -r line; do
    if [ -z "$line" ]; then
        echo '{"status": "Stopped", "title": "No Music", "artist": "None", "album": "None"}'
    else
        echo "$line"
    fi
done
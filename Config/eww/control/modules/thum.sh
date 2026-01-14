#!/bin/bash

# Define where to save the thumbnail
TMP_DIR="/tmp/eww/media"
TMP_ART="$TMP_DIR/current_art.jpg"
DEFAULT_ART="$HOME/.config/eww/assets/default_cover.png"

# Create directory if it doesn't exist
mkdir -p "$TMP_DIR"

# Get the art URL from playerctl
ART_URL=$(playerctl metadata mpris:artUrl 2>/dev/null)

if [ -z "$ART_URL" ]; then
    # If no art is found, output a default image path
    echo "$DEFAULT_ART"
else
    # Check if the URL is a web link (Spotify/Web) or a local file
    if [[ "$ART_URL" == http* ]]; then
        # Only download if it's a new URL to save resources
        curl -s "$ART_URL" -o "$TMP_ART"
        echo "$TMP_ART"
    elif [[ "$ART_URL" == file://* ]]; then
        # Strip the file:// prefix and output the path
        echo "${ART_URL#file://}"
    else
        echo "$DEFAULT_ART"
    fi
fi
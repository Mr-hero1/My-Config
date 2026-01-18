#!/bin/bash

# Pick a color using hyprpicker
color=$(hyprpicker -a -t -r 2>/dev/null)

# Exit silently if no color was picked or an error occurred
if [[ -z "$color" || "$color" == "[ERR"* ]]; then
    exit 0
fi

# Create a 64x64 color swatch using ImageMagick 7
magick -size 64x64 xc:"$color" /tmp/color.png

# Show notification with the picked color
notify-send \
  -a "[Color]" \
  -t 2000 \
  -i /tmp/color.png \
  --hint=int:transient:1 \
  "" "$color"

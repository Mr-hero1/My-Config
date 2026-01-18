#!/bin/bash

# 1. Get the initial workspace ID immediately
hyprctl activeworkspace -j | jq -r '.id'

# 2. Listen for events and filter for workspace changes
# 'stdbuf -o0' ensures the output isn't buffered (so it's instant)
# 'uniq' prevents the double-triggering you're seeing
socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | \
  stdbuf -o0 awk -F '>>' '/workspace>>/ {print $2}' | \
  stdbuf -o0 uniq
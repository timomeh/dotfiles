#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Sanitize Clipboard
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 😶‍🌫️

# Documentation:
# @raycast.description Clean hidden characters from the clipboard
# @raycast.author Timo

pbpaste \
  | perl -CIO -pe 's/[\p{Cf}\x{3164}]//g' \
  | pbcopy
echo "Cleaned!"


#!/usr/bin/env bash

# --- STAGE 1: Normalization ---
# Handle input arguments and expand tilde (~) if present
if [[ $# -ne 1 ]]; then
  >&2 echo "usage: $0 FILENAME[:LINENO][:IGNORED]"
  exit 1
fi

INPUT=${1/#\~\//$HOME/}
FILE=$INPUT
CENTER=0

# Logic to extract filename and line number (e.g., from 'grep' output)
# "main.py:10" -> FILE="main.py", CENTER="10"
if [[ ! -r $FILE ]]; then
  if [[ $FILE =~ ^(.+):([0-9]+) ]]; then
    FILE=${BASH_REMATCH[1]}
    CENTER=${BASH_REMATCH[2]}
  fi
fi

# --- STAGE 2: The Dispatcher ---

# 1. Directory: Immediate exit if it's a folder
if [[ -d "$FILE" ]]; then
  tree -C "$FILE"
  exit 0
fi

# 2. Metadata Extraction: Ask the OS what the file is
MIME=$(file --dereference --brief --mime-type -- "$FILE")

# 3. Binary: If it's not text, show metadata and exit
if [[ "$MIME" =~ image/ ]] || ([[ "$MIME" == "application/"* ]] && [[ "$MIME" != "application/json" ]]); then
  stat -x "$FILE"
  exit 0
fi

# --- STAGE 3: Text Fallback ---

# Determine which 'bat' command is available (bat or batcat)
BAT_CMD="cat"
if command -v bat > /dev/null; then
  BAT_CMD="bat"
elif command -v batcat > /dev/null; then
  BAT_CMD="batcat"
fi

# Run the text viewer
# We use "$INPUT" here instead of "$FILE" to preserve original formatting if needed,
# or we can pass $CENTER to highlight the line.
$BAT_CMD --style="${BAT_STYLE:-numbers}" \
         --color=always \
         --pager=never \
         --highlight-line="$CENTER" \
         -- "$FILE"

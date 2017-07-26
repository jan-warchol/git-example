#!/bin/sh
# `watch` command doesn't work with colored git log - use shell loop

TARGET=${1:-"--branches --remotes"}

COMMAND="git log --oneline --decorate --graph --color $TARGET"
OUTPUT="/tmp/git-log-output`pwd`"
mkdir -p `dirname "$OUTPUT"`

while true; do
  # trim command output in case it doesn't fit the screen
  TERMINAL_HEIGHT=$(tput lines)
  # subtract two lines for heading and one for the cursor
  OUTPUT_HEIGHT=$(echo $TERMINAL_HEIGHT - 3 | bc)

  # use a temp file to avoid blinking
  $COMMAND | head -${OUTPUT_HEIGHT} > "$OUTPUT"

  # clear terminal buffer completely (as opposed to "clear" command)
  tput reset
  printf "[%s] History visualization:\n\n" "$(date)"
  # less allows disabling line wrapping (as opposed to "cat")
  less -SXE "$OUTPUT"
  sleep 0.2
done

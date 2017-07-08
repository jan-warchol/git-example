#!/bin/sh
# `watch` command doesn't work with colored git log - use shell loop

COMMAND='git log --oneline --decorate --graph --color --branches --remotes'

while true; do
  # trim command output in case it doesn't fit the screen
  TERMINAL_HEIGHT=$(tput lines)
  # subtract two lines for heading and one for the cursor
  OUTPUT_HEIGHT=$(echo $TERMINAL_HEIGHT - 3 | bc)

  # use a temp file to avoid blinking
  $COMMAND | head -${OUTPUT_HEIGHT} > /tmp/git-log-output

  # clear terminal buffer completely (as opposed to "clear" command)
  tput reset
  printf "[%s] History visualization:\n\n" "$(date)"
  # less allows disabling line wrapping (as opposed to "cat")
  less -SXE /tmp/git-log-output
  sleep 0.2
done

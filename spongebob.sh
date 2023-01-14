#!/bin/bash

curl -s https://raw.githubusercontent.com/nmdra/spongebob.sh/main/spongebob.txt --output ~/.cache/spongebobLinks.txt
episode=$(fzf < ~/.cache/spongebobLinks.txt)

host="https://ww.megacartoons.net/video/SpongeBob-SquarePants-"
link=$(echo "$episode" | cut --delimiter=" " --fields=2)
epno=$(echo "$episode" | cut --delimiter=" " --fields=1)

RED='\033[0;31m'

echo -e "Loading...\nEpisode:$epno\tTitle:${RED}${link//-/ }"

mpv "$host$link.mp4" 1> /dev/null 2> /dev/null || xdg-open "$host$link.mp4" 1> /dev/null 2> /dev/null


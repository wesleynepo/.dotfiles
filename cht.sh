#!/usr/bin/env bash

languages=$(echo "golang c cpp typescript rust javascript php" | tr " " "\n")
core_utils=$(echo "find xargs sed awk" | tr " " "\n")

selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "What you want? " query

if echo "$languages" | grep -qs $selected; then
	tmux split-window -v bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less"
else
	tmux split-window -v bash -c "curl cht.sh/$selected~$query | less"
fi


#!/bin/bash

tmux_conf=~/.tmux.conf

if [ ! -f "$tmux_conf" ]
then
	touch "$tmux_conf"
fi

this_dir=$(cd "$(dirname "$0")"; pwd)

my_tmux_conf="$this_dir/tmux.conf"

if ! grep --quiet "$my_tmux_conf" "$tmux_conf"
then
	echo "Appending the following to $tmux_conf:"
	echo "source $my_tmux_conf" | tee -a "$tmux_conf"
	echo
else
	echo "$tmux_conf already includes $my_tmux_conf"
fi

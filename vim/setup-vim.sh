#!/bin/bash

vimrc=~/.vimrc

if [ ! -f "$vimrc" ]
then
	touch "$vimrc"
fi

this_dir=$(cd "$(dirname "$0")"; pwd)

my_vimrc="$this_dir/vimrc"

if ! grep --quiet "$my_vimrc" "$vimrc"
then
	echo "Appending to $vimrc:"
	echo "source $my_vimrc" | tee -a "$vimrc"
	echo
else
	echo "$vimrc already includes $my_vimrc"
fi

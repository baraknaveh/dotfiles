#!/bin/bash

# Setting ~/.gitconfig to include the gitconfig file in this directory.
# It's ok to run the script more than once, it will only make changes if
# necessary.

this_dir=$(cd "$(dirname "$0")"; pwd)
gitconf=~/.gitconfig

if [ ! -f "$gitconf" ]
then
        touch "$gitconf"
fi

my_gitconf="$this_dir/gitconfig"

if ! grep --quiet "$my_gitconf" "$gitconf"
then
        echo "Setting $gitconf to include $my_gitconf"
        git config --global --add include.path "$my_gitconf"
        # The following line will only work for git 1.8+
        git config --global push.default simple
else
        echo "$gitconf already includes $my_gitconf"
fi

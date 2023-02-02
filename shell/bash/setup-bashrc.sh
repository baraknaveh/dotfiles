#!/bin/bash

bashrc=~/.bashrc

if [ ! -f "$bashrc" ]
then
        touch "$bashrc"
fi

this_dir=$(cd "$(dirname "$0")"; pwd)

my_bashrc="$this_dir/bashrc"

if ! grep --quiet "$my_bashrc" "$bashrc"
then
        echo "Appending the following to $bashrc:"
        cat << EOF | tee -a "$bashrc"

if [ -f $my_bashrc ]
then
        source $my_bashrc
fi

EOF
else
        echo "$bashrc already includes $my_bashrc"
fi

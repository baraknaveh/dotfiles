#!/bin/bash

zshrc=~/.zshrc

if [ ! -f "$zshrc" ]
then
        touch "$zshrc"
fi

this_dir=$(cd "$(dirname "$0")"; pwd)

my_zshrc="$this_dir/zshrc"

if ! grep --quiet "$my_zshrc" "$zshrc"
then
        echo "Appending the following to $zshrc:"
        cat << EOF | tee -a "$zshrc"

if [ -f $my_zshrc ]
then
        source $my_zshrc
fi

EOF
else
        echo "$zshrc already includes $my_zshrc"
fi

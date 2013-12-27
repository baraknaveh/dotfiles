#!/bin/bash

#
# Sets up a new computer with my comfy env. 
#

this_dir=$(cd "$(dirname "$0")"; pwd)

"$this_dir/vim/setup-vim.sh"
"$this_dir/git/setup-gitconfig.sh"

cd "$this_dir"
source "$this_dir/git/setup-github.sh"


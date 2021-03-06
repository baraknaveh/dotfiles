#!/bin/bash

#
# Sets up a new computer with my comfy env. 
#

this_dir=$(cd "$(dirname "$0")"; pwd)

"$this_dir/bash/setup-bashrc.sh"
"$this_dir/git/setup-gitconfig.sh"
"$this_dir/tmux/setup-tmux.sh"
"$this_dir/vim/setup-vim.sh"

echo "Setting up github defaults for $this_dir"
pushd "$this_dir" > /dev/null
source "$this_dir/git/setup-github.sh"
popd > /dev/null

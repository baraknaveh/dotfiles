#!/bin/bash

this_dir=$(cd "$(dirname "$0")"; pwd)

git config --global --add include.path "$this_dir/gitconfig"
git config --global --replace user.name "Barak Naveh"

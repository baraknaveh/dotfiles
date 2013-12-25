#!/bin/bash
# optionally run sudo apt-get update before installing
dir="`dirname $0`"
echo $dir
"$dir/add-debian-goodies.sh"
sudo apt-get install unity-tweak-tool 

#!/bin/bash

# Builds Vim from source.
# The script automates a bunch of steps and (hopefully) ensures that I can
# have a consistent Vim version across different machines.

echo "Installing required packages..."
sudo yum groupinstall 'Development Tools'
sudo yum install ruby perl-devel python-devel ruby-devel perl-ExtUtils-Embed \
         ncurses-devel

BUILD_DIR="/tmp/vim-build.$USER"
rm -rf   $BUILD_DIR
mkdir -p $BUILD_DIR
cd       $BUILD_DIR

echo "Building in $BUILD_DIR"

MIRROR="http://ftp.vim.org/pub/vim"
wget -c "$MIRROR/unix/vim-7.4.tar.bz2"
tar -xjf vim-7.4.tar.bz2

cd vim74
rm -rf src/auto/config.cache

make clean
./configure --with-features=huge --enable-perlinterp --enable-rubyinterp \
            --enable-pythoninterp
make

echo
echo "If the build succeeded, you can install the shiny new vim by typing:"
echo "  cd $BUILD_DIR/vim74"
echo "  sudo make install"

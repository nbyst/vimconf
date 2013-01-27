#!/bin/sh
echo "starting copy vimconf/* to your system"
set -x

#ln -s ~/vimconf/.vimrc ~/.vimrc
#ln -s ~/vimconf/vim ~/.vim
cd $HOME/.vim
git clone git://github.com/Shougo/neobundle.vim.git

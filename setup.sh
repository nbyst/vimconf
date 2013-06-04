#!/bin/sh
VIMCONF=$(cd `dirname $0`; pwd)
set -x
ln -s $VIMCONF/.vimrc ~/.vimrc
ln -s $VIMCONF/vim ~/.vim
cd $HOME/.vim
git clone git://github.com/Shougo/neobundle.vim.git

#ctagsを使う場合
sudo apt-get install exuberant-ctags 

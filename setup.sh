#!/bin/sh
VIMCONF=$(cd `dirname $0`; pwd)
set -x
ln -s $VIMCONF/.vimrc ~/.vimrc
ln -s $VIMCONF/vim ~/.vim
cd $HOME/.vim
git submodule add git://github.com/Shougo/neobundle.vim.git vim/neobundle.vim
git init

#ctagsを使う場合
INST_STAT=`dpkg -l | grep exuberant-ctags`
if [ -z "$INST_STAT" ]; then
	sudo apt-get install exuberant-ctags 
fi

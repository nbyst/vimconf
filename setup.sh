#!/bin/sh

#if [ -f ~/.bash_aliases ]; then
#  git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
#fi
ln -s ~/vimconf/.vimrc ~/.vimrc
#if [ -nf ~/.vimrc]; then
  ln -s ~/vimconf/vim ~/.vim
#fi
ln -s ~/vimconf/.gvimrc ~/.gvimrc

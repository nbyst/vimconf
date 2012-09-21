#!/bin/sh

#if [ -f ~/.]; then
#  git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
#fi

ln -s ~/vimconf/.vimrc ~/.vimrc
#ln -s ~/vimconf/.gvimrc ~/.gvimrc
#if [ -nf ~/.vimrc]; then
  ln -s ~/vimconf/vim ~/.vim
#fi
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

" Vundle Setting
set nocompatible
filetype off

 set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" original repos on github
Bundle 'git://github.com/gmarik/vundle.git'
Bundle 'ujihisa/quickrun'
Bundle 'git://github.com/Shougo/vimproc.git'
Bundle 'git://github.com/Shougo/neocomplcache.git'
Bundle 'git://github.com/Shougo/unite.vim.git'
Bundle 'git://github.com/Shougo/vimfiler.git'
Bundle 'git://github.com/Shougo/vimshell.git'
Bundle 'git://github.com/mattn/webapi-vim.git'
Bundle 'git://github.com/mattn/zencoding-vim.git'
Bundle 'git://github.com/vim-scripts/IndentAnything.git'
Bundle 'git://github.com/vim-scripts/JavaScript-Indent.git'
Bundle 'git://github.com/msanders/snipmate.vim.git'
Bundle 'git://github.com/vim-scripts/sudo.vim.git'
Bundle 'git://github.com/vim-scripts/TwitVim.git'
Bundle 'git://github.com/tpope/vim-fugitive.git'
Bundle 'git://github.com/thinca/vim-ref.git'
Bundle 'git://github.com/vim-scripts/taglist.vim.git'
Bundle 'git://github.com/fuenor/qfixhowm.git'
"API KEY など必"要などでとりあえずコメントアウト
"Bundle 'git://github.com/immerzeel/vim-remember-the-milk.git' 
filetype plugin indent on

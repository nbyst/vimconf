" Vundle Setting
set nocompatible
filetype off

 set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" original repos on github
Bundle 'git://github.com/gmarik/vundle.git'
Bundle 'ujihisa/quickrun'
"Bundle 'git://github.com/Shougo/vimproc.git'
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
filetype plugin indent on
" ---------------------------------------------------

"VI互換ではなく、vimの動きをする設定
set nocompatible
"無名レジスタに入るデータが*レジスタにも入るようにする
"->他のアプリケーションでも使える
set clipboard+=unnamed


set tabstop=2 sw=2 sts=2
set showmode
set showmatch
set number
set encoding=utf8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
set incsearch
set title
set expandtab
set tabpagemax=15

set fdm=indent

syntax on

"colorscheme 関係のインストール
set background=dark
" Set manual completion length.                                                    [0/0]
let g:neocomplcache_manual_completion_start_length = 9
"_区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
"補完ウィンドウの設定 :help completeopt
set completeopt=menuone

"************************
"Unite Settings
  " バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
"" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
"" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>

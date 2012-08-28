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

nnoremap j gj
nnoremap k gk
nnoremap <Esc><Esc> :noh<CR>


set tabstop=2 sw=2 sts=2
set showmode
set showmatch
set number
set encoding=utf8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
set incsearch
set title
set tabpagemax=15


"set cursorcolumn
set cursorline

set wildmenu
set wildmode=list:longest

set fdm=syntax

syntax on

set mouse=a

"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM
"□や○の文字があってもカーソル位置がずれないようにする。
set ambiwidth=double
"画面最後の行をできる限り表示する。
set display+=lastline

set tags=.tags
"----------------------------------
" map 
"----------------------------------
nnoremap tl gt
nnoremap th gT
"Tabキーでたtabfindを表示
nnoremap <Tab> :tabf<space>

"ファイル名を表示(full path)
nnoremap fn :echo expand("%:p")<CR>
"ファイルタイプを表示
nnoremap ft :echo &ft<CR>

"for javascript
au FileType javascript set ts=2 sw=2 
"expandtab
au BufNewFile *.js set ft=javascript fenc=utf-8


"VimFiler
nnoremap <silent> ,vf :VimFiler<CR>

"********************************************************************
"「Rename newfilename」で変更したいファイル名を指定して実行します。
"!を付けると強制保存して変更
command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)
"********************************************************************
"xvkbdを使ってEsc押したら自動的にIMEをOFFする設定
"inoremap <silent> <esc> <esc>:call ForceImeOff()<cr>
"function! ForceImeOff()
"		let imeoff = system('xvkbd -text "\[Control]\[Shift]\[space]" > /dev/null 2>&1')
"endfunction
"***********************************************

if filereadable(expand('~/vimconf/.neocomplcache.vimrc'))
    source ~/vimconf/.neocomplcache.vimrc
endif

"************************
"Unite Settings
let g:unite_source_bookmark_directory =	'~/.vim/bookmark'
  " バッファ一覧
nnoremap <silent> bf :<C-u>Unite buffer<CR>
"" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
"" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
 " ブックマーク一覧
nnoremap <silent> ,ub :<C-u>Unite bookmark<CR>
 " 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ESCキーを2回押すと終了する !!!今のところきいてないよ
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

if filereadable(expand('~/vimconf/.local.vimrc'))
    source ~/vimconf/.local.vimrc
endif

" ---------------------------------------------------
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

syntax on
set fdm=indent

"colorscheme 関係のインストール
set background=dark
colorscheme desert

"vimでマウス使えるようになる
set mouse=a

"辞書関係
set complete+=k
autocmd FileType cpp :set dictionary=~/.vim/dictionary/cpp.dict<CR>

"indent
	"c言語みたいなインデントだとさ。
	set cindent
	set autoindent

"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM
"□や○の文字があってもカーソル位置がずれないようにする。
set ambiwidth=double
"画面最後の行をできる限り表示する。
set display+=lastline

"for javascript
au FileType javascript set ts=2 sw=2 expandtab
au BufNewFile *.js set ft=javascript fenc=utf-8

"******************
	"map script
"******************
"charcter count
nnoremap \wc :%s/./&/g<CR>
"stop high light
nnoremap nh :noh<CR>
"physical cursol move
nnoremap j gj
nnoremap k gk
"tab moves
nnoremap <C-l> gt
nnoremap <C-h> gT
"Tabキーでたtabfindを表示
nnoremap <Tab> :tabf<space>

"ファイル名を表示(full path)
nnoremap fn :echo expand("%:p")<CR>
"ファイルタイプを表示
nnoremap ft :echo &ft<CR>

"VimFiler
nnoremap <silent> ,vf :VimFiler<CR>

"バッファ選択/削除/確認
nnoremap \<BS> <Esc>:ls<CR>:b

"********************************************************************
"「Rename newfilename」で変更したいファイル名を指定して実行します。
"!を付けると強制保存して変更
command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)
"********************************************************************
"xvkbdを使ってEsc押したら自動的にIMEをOFFする設定
inoremap <silent> <esc> <esc>:call ForceImeOff()<cr>
function! ForceImeOff()
		let imeoff = system('xvkbd -text "\[Control]\[Shift]\[space]" > /dev/null 2>&1')
endfunction
"***********************************************
""" twitvim
let twitvim_count = 40
nnoremap ,tp :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR><C-w>j
nnoremap ,tu :<C-u>UserTwitter<CR><C-w>j
nnoremap ,tr :<C-u>RepliesTwitter<CR><C-w>j
nnoremap ,tn :<C-u>NextTwitter<CR>

"autocmd FileType twitvim call s:twitvim_my_settings()
"function! s:twitvim_my_settings()
"    set nowrap
"  endfunction
""" ********************************************

"neocomplcache の設定
let g:neocomplcache_enable_at_startup = 1

"辞書ファイルからの補完(using neocomplcache)
let g:neocomplcache_dictionary_filetype_lists =  { 
  \ 'default' : '~/.vim/dictionary/default.dict',
  \ 'c' : '~/.vim/dictionary/c.dict',
  \ 'cpp' : '~/.vim/dictionary/cpp.dict',
  \ 'php' : '~/.vim/dictionary/php.dict',
  \ 'tex' : '~/.vim/dictionary/tex.dict',
  \ 'haskell' : '~/.vim/dictionary/haskell.dict',
  \ 'html' : '~/.vim/dictionary/html.dict'
\}

" 大文字、小文字の区別をするかどうか1なら区別しない。
let g:neocomplcache_enable_smart_case = 0
" 自動的に一番上の候補を選ぶ(この動作はAutoComplpopと似た動作になる)
let g:neocomplcache_enable_auto_select = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
" Set manual completion length.
let g:neocomplcache_manual_completion_start_length = 9
"_区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
"補完ウィンドウの設定 :help completeopt
set completeopt=menuone

"************************
"Unite Settings
  " バッファ一覧
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
"" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
"" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>

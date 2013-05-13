filetype off
"neobundle自体のpath
if has('vim_starting')
	set runtimepath+=$HOME/.vim/neobundle.vim
endif
"neobundleが管理するプラグインを入れるdirのpath
call neobundle#rc(expand('~/.vim/bundle'))
"NeoBundle 'immerzeel/vim-remember-the-milk' 
"NeoBundle 'basyura/jslint.vim'
"NeoBundle 'hallettj/jslint.vim'
NeoBundle 'ujihisa/quickrun'
NeoBundle 'Shougo/vimfiler'
"NeoBundle 'Shougo/vimshell'
"NeoBundle 'fuenor/qfixhowm'
NeoBundle	'Shougo/neocomplcache'
NeoBundle 'Shougo/vimproc', {	'build' : {
			\		'unix': 'make -f make_unix.mak',
			\		'cygwin': 'make -f make_cygwin.mak',
			\		'mac': 'make -f make_mac.mak',
			\	},
			\}
NeoBundle	'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/zencoding-vim'
"NeoBundle 'mattn/benchvimrc-vim' 
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-surround'
"NeoBundle 'thinca/vim-painter'
NeoBundle 'thinca/vim-showtime'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-scripts/TwitVim'
NeoBundle 'vim-scripts/IndentAnything'
NeoBundle 'vim-scripts/JavaScript-Indent'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle 'kana/vim-tabpagecd'
"NeoBundle 'tyru/skk.vim'
NeoBundle 'yuratomo/w3m.vim'
"color scheme
NeoBundle 'nanotech/jellybeans.vim'
"NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'vim-scripts/desertEx'
NeoBundleCheck

filetype plugin indent on
colorscheme blackdust

"無名レジスタに入るデータが*レジスタにも入るようにする->他のアプリケーションでも使える
set clipboard+=unnamed
set mouse=a
set cindent
set autoindent 
set tabstop=2 sw=2 sts=2
"set tabpagemax=15
set showmatch
set incsearch
"status line関連
set wildmenu
set nowrap
set wildmode=list:longest 

"encording関係
"set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

set fdm=indent
"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM
"□や○の文字があってもカーソル位置がずれないようにする。
set ambiwidth=double
set tags=tags,.tags,~/.tags
syntax on
set nu

"「Rename newfilename」で変更したいファイル名を指定して実行します。
"!を付けると強制保存して変更
command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)

"xvkbdを使ってEsc押したら自動的にIMEをOFFする設定
"inoremap <silent> <esc> <esc>:call ForceImeOff()<cr>
"function! ForceImeOff()
"		let imeoff = system('xvkbd -text "\[Control]\[Shift]\[space]" > /dev/null 2>&1')
"endfunction
"----------------------------------
" ab 
"----------------------------------
ab 9- --------------------------------
"----------------------------------
" map 
"----------------------------------
nnoremap Y y$
nnoremap <leader>s :%s/
vnoremap <leader>s :%s/
nnoremap <leader>d i<C-R>=strftime("%Y/%m/%d (%a) %H:%M")<CR><CR>
" F1を無効化
nnoremap <F1> <Nop>
inoremap <F1> <Nop>
nnoremap j gj
nnoremap k gk

nnoremap gi :Git 

"gtags
nnoremap \g :Gtags <CR>
nnoremap gF :Gtags -f %<CR>
nnoremap gc :GtagsCursor<CR>
nnoremap gn :cn<CR>
nnoremap gp :cp<CR>
"
"nnoremap tl gt
"nnoremap th gT
"
"nnoremap sl :set list<CR>
"nnoremap nl :set nolist<CR>
" nnoremap <Tab> :tabf<space>
inoremap <C-a> <Home>
inoremap <C-e> <End>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
onoremap ) t)
"ファイル名を表示(full path)
nnoremap fn :echo expand("%:p")<CR>
"ファイルタイプを表示
"nnoremap ft :echo &ft<CR>
nnoremap <leader>g :W3m google 
"----------------------------------
" file, 言語ごとの設定
"----------------------------------

autocmd FileType php setl expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType python setlocal ts=4 sw=4 sta et sts ai expandtab
autocmd FileType html setlocal et ai
autocmd FileType smarty setlocal et ai

"for javascript
au FileType javascript set ts=2 sw=2 
au BufNewFile *.js set ft=javascript fenc=utf-8
"jslint.vimfunction! s:  autocmd BufLeave
"&lt;buffer&gt; call jslint#clear()  autocmd BufWritePost &lt;buffer&gt; call
"jslint#check()  autocmd CursorMoved  &lt;buffer&gt; call
"jslint#message()endfunctionautocmd FileType javascript call
"s:javascript_filetype_settings()

" basyura さんの示した設定
"augroup MyGroup
"	autocmd! MyGroup
"	autocmd FileType javascript call s:javascript_filetype_settings()
"augroup END
"
"function! s:javascript_filetype_settings()
"	autocmd BufLeave     <buffer> call jslint#clear()
"	autocmd BufWritePost <buffer> call jslint#check()
"	autocmd CursorMoved  <buffer> call jslint#message()
"endfunction

"----------------------------------
" pluginや特定の機能の設定
"----------------------------------
"neocomplcache
if filereadable(expand('~/.vim/neocomplcache.vimrc'))
    source ~/.vim/neocomplcache.vimrc
endif
"Unite Settings
if filereadable(expand('~/.vim/unite.vimrc'))
    source ~/.vim/unite.vimrc
endif
let g:ref_phpmanual_path = $HOME.'/doc/php-chunked-xhtml'
let g:ref_sqlitemanual_path = $HOME.'/doc/sqlite-doc'

"quickrunで横分割
let g:quickrun_config={'*': {'split': ''}}
"
let g:snippets_dir = '~/.vim/snippets/'

nnoremap ,uo :Unite -no-quit -vertical -winwidth=30 outline<CR>
"**************************
"localのvimrc
if filereadable(expand('~/.local.vimrc'))
    source ~/.local.vimrc
endif

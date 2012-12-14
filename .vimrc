"Vundle Settings
if filereadable(expand('~/vimconf/bundle.vimrc'))
    source ~/vimconf/bundle.vimrc
endif
"無名レジスタに入るデータが*レジスタにも入るようにする->他のアプリケーションでも使える
set clipboard+=unnamed
set mouse=a
set cindent
set tabstop=2 sw=2 sts=2
"set tabpagemax=15
set showmatch
set number
set incsearch
"status line関連
set wildmenu
"set wildmode=list:longest //set disable for speedy
"encording関係
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
set fdm=indent
"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM
"□や○の文字があってもカーソル位置がずれないようにする。
set ambiwidth=double
"「Rename newfilename」で変更したいファイル名を指定して実行します。
"!を付けると強制保存して変更
command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)
"
"xvkbdを使ってEsc押したら自動的にIMEをOFFする設定
"inoremap <silent> <esc> <esc>:call ForceImeOff()<cr>
"function! ForceImeOff()
"		let imeoff = system('xvkbd -text "\[Control]\[Shift]\[space]" > /dev/null 2>&1')
"endfunction
"----------------------------------
" ab 
"----------------------------------
ab lj <!--{*
ab rj  *}-->
"----------------------------------
" map 
"----------------------------------
" F1を無効化
nnoremap <F1> <Nop>
inoremap <F1> <Nop>
nnoremap j gj
nnoremap k gk
"
"nnoremap tl gt
"nnoremap th gT
"
"nnoremap sl :set list<CR>
"nnoremap nl :set nolist<CR>
" nnoremap <Tab> :tabf<space>
"ファイル名を表示(full path)
nnoremap fn :echo expand("%:p")<CR>
"ファイルタイプを表示
"nnoremap ft :echo &ft<CR>
"----------------------------------
" file, 言語ごとの設定
"----------------------------------
"for php
autocmd FileType php setl expandtab shiftwidth=4 softtabstop=4 tabstop=4

"for javascript
au FileType javascript set ts=2 sw=2 
au BufNewFile *.js set ft=javascript fenc=utf-8

"----------------------------------
" pluginや特定の機能の設定
"----------------------------------
"neocomplcache
if filereadable(expand('~/vimconf/neocomplcache.vimrc'))
    source ~/vimconf/neocomplcache.vimrc
endif
"Unite Settings
if filereadable(expand('~/vimconf/unite.vimrc'))
    source ~/vimconf/unite.vimrc
endif
"vim-ref config
let g:ref_phpmanual_path = "/home/nt/doc/php-chunked-xhtml"
let g:ref_sqlitemanual_path = "/home/nt/doc/sqlite-doc" "test-config
"VimFiler
"nnoremap <silent> ,vf :VimFiler<CR>
"tags
if filereadable(expand('~/vimconf/tags.vimrc'))
    source ~/vimconf/tags.vimrc
endif
"**************************
"localのvimrc
if filereadable(expand('~/vimconf/.local.vimrc'))
    source ~/vimconf/.local.vimrc
endif
"quickrunで横分割
let g:quickrun_config={'*': {'split': ''}}

syntax on

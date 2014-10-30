"neobundle自体のpath
if has('vim_starting')
	set runtimepath+=$HOME/.vim/neobundle.vim
endif
"neobundleが管理するプラグインを入れるdirのpath
call neobundle#begin(expand('~/.vim/bundle'))
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
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'mattn/webapi-vim'
"NeoBundle 'mattn/emoji-vim'
NeoBundle 'mattn/emmet-vim', {
			\"autoload" : {"filetypes" :[ "html" ]}
			\}
"NeoBundle 'mattn/benchvimrc-vim'  " :BenchVimrc を実行し%sort すると見やすい
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-ref'
"NeoBundle 'tpope/vim-surround'
"NeoBundle 'thinca/vim-painter'
"NeoBundle 'thinca/vim-showtime'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-scripts/IndentAnything'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'vim-scripts/gtags.vim'
"NeoBundle 'kana/vim-tabpagecd'
"NeoBundle 'tyru/skk.vim'
NeoBundle 'tyru/open-browser.vim'
"NeoBundle 'rking/ag.vim'
"NeoBundle 'vim-scripts/MultipleSearch'
NeoBundle 'Blackrush/vim-gocode'
NeoBundle 'mitsuhiko/vim-jinja', {
			\"autoload" : {"filetypes" :["htmljinja"]}
			\}
NeoBundle 'davidhalter/jedi-vim', {
			\"autoload" : {"filetypes" :["python"]}
			\}
"NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'vim-ruby/vim-ruby', {
			\"autoload" : {"filetypes" :["ruby"]}
			\}
NeoBundle 'bbatsov/rubocop', {
			\"autoload" : {"filetypes" :["ruby"]}
			\}
NeoBundle 'aharisu/vim_goshrepl', {
			\"autoload" : {"filetypes" :["ruby"]}
			\}
"NeoBundle 'aharisu/vim-gdev' " Gauche用のプラグイン

"-------for redmine--------------
"NeoBundle 'kana/vim-metarw'
"NeoBundle 'mattn/vim-metarw-redmine' "need vim-metarw
"NeoBundle 'toritori0318/vim-redmine'
"----------color scheme-------------
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/desertEx'
NeoBundle 'vim-scripts/newspaper.vim'
"NeoBundle 'vim-scripts/candy.vim'
"NeoBundle 'luckydev/150colors'
"--------- for markdown ---------
NeoBundle 'plasticboy/vim-markdown'
"NeoBundle 'kannokanno/previm'
call neobundle#end()
NeoBundleCheck


filetype plugin indent on

"hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
"hi PmenuSel ctermbg=blue ctermfg=black
"hi PmenuSbar ctermbg=0 ctermfg=9
"hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF
"hi PmenuThumb ctermfg=3

"無名レジスタに入るデータが*レジスタにも入るようにする->他のアプリケーションでも使える
set clipboard+=unnamed
set mouse=a
set cindent
set autoindent 
set tabstop=4 sw=4 sts=4
"set tabpagemax=15
set showmatch
set incsearch
"status line関連
set wildmenu
set wrap
set wildmode=list:longest 

"encording関係
if has('win32') || has('win64') || split(system('uname'),'_')[0] == 'MINGW32'
	set encoding=cp932
else
	set encoding=utf-8
endif

set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,default,latin

set fdm=indent
"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM
"□や○の文字があってもカーソル位置がずれないようにする。
set ambiwidth=double
set tags=tags,.tags,~/.tags
syntax on
set nu
set pastetoggle=<F2>
set completeopt=menu,preview

set list
set listchars=tab:»_,trail:-

set modeline

"swapfile and backupfile settings
set backup
set backupdir=/tmp
set swapfile
set directory=/tmp

"「Rename newfilename」で変更したいファイル名を指定して実行します。
"!を付けると強制保存して変更
command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)

"xvkbdを使ってEsc押したら自動的にIMEをOFFする設定
"inoremap <silent> <esc> <esc>:call ForceImeOff()<cr>
"function! ForceImeOff()
"		let imeoff = system('xvkbd -text "\[Control]\[Shift]\[space]" > /dev/null 2>&1')
"endfunction

"----------------------------------
" map 
"----------------------------------
nnoremap - %
nnoremap Y y$
nnoremap <leader>l :set list!<CR>
nnoremap <leader>w :set wrap!<CR>
vnoremap <leader>s :%s/
nnoremap <leader>d i<C-R>=strftime("%Y/%m/%d %H:%M")<CR><CR>
" F1を無効化
nnoremap <F1> <Nop>
inoremap <F1> <Nop>
nnoremap j gj
nnoremap k gk

cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
inoremap <C-a> <Home>
inoremap <silent> jj <ESC>
inoremap <C-e> <End>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
onoremap ) t)
"ファイル名を表示(full path)
nnoremap fn :echo expand("%:p")<CR>
"ファイルタイプを表示
"nnoremap ft :echo &ft<CR>

"範囲内検索
vnoremap z/ <ESC>/\%V

nnoremap r :QuickRun<CR>
"----------------------------------
" file, 言語ごとの設定
"----------------------------------


augroup filetypedetect
	au BufRead,BufNewFile Makefile setfiletype make
	autocmd FileType php setl expandtab shiftwidth=4 softtabstop=4 tabstop=4
	autocmd FileType python setlocal ts=4 sw=4 sts=4 sta ai expandtab
	autocmd FileType ruby setlocal ts=4 sw=4 sts=4 sta ai expandtab
	autocmd FileType html setlocal expandtab ai smartindent
	autocmd FileType htmljinja setlocal expandtab ai smartindent
	autocmd FileType smarty setlocal et ai
	autocmd FileType scheme setlocal autoindent expandtab

	"for javascript
	au FileType javascript set ts=2 sw=2 
	au BufNewFile *.js set ft=javascript fenc=utf-8
"jslint.vimfunction! s:  autocmd BufLeave
"&lt;buffer&gt; call jslint#clear()  autocmd BufWritePost &lt;buffer&gt; call
"jslint#check()  autocmd CursorMoved  &lt;buffer&gt; call
"jslint#message()endfunctionautocmd FileType javascript call
"s:javascript_filetype_settings()

"function! s:javascript_filetype_settings()
"	autocmd BufLeave     <buffer> call jslint#clear()
"	autocmd BufWritePost <buffer> call jslint#check()
"	autocmd CursorMoved  <buffer> call jslint#message()
"endfunction
augroup END

"----------------------------------
" pluginや特定の機能の設定
"----------------------------------
"Quickrun
"quickrunで横分割
let g:quickrun_config={'*': {'split': ''}}

let g:quickrun_config['lisp'] = {
\   'command': 'clisp',
\   'eval': 1,
\   'eval_template': '(print %s)',
\}
let g:quickrun_config = {
\  'go': {
\    'command': 'go',
\    'exec': ['go run %s',]
\  }
\}


"NERD Commenter
" コメントした後に挿入するスペースの数
let NERDSpaceDelims = 1
" キーマップの変更。<Leader>=\+cでコメント化と解除を行う。
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle

"w3m.vim
nnoremap <leader>g :W3m google 

"neocomplcache
if filereadable(expand('~/.vim/neocomplcache.vimrc'))
    source ~/.vim/neocomplcache.vimrc
endif

"unite.vim
if filereadable(expand('~/.vim/unite.vimrc'))
    source ~/.vim/unite.vimrc
endif
let g:ref_phpmanual_path = $HOME.'/doc/php-chunked-xhtml'
let g:ref_sqlitemanual_path = $HOME.'/doc/sqlite-doc'
nnoremap ,uo :Unite -no-quit -vertical -winwidth=50 outline<CR>

"snipmate.vim
let g:snippets_dir = '~/.vim/snippets/'

"-- gtags.vim --
"gtags grep
nnoremap <C-e> :Gtags -g
"このファイルの関数一覧
nnoremap \g :Gtags -f %<CR>
"cursol上オブジェクトの定義元を探す
nnoremap <C-g> :Gtags <C-r><C-w><CR>
"cursol上オブジェクトが呼ばれている場所を探す
nnoremap <C-k> :Gtags -r <C-r><C-w><CR>
"検索結果の前後移動
nnoremap zn :cn<CR>
nnoremap zp :cp<CR>
"nnoremap gc :GtagsCursor<CR>

"vim-fugitive
nnoremap <silent> <Space>gb :Gblame<CR>
nnoremap <silent> <Space>gd :Gdiff<CR>
nnoremap <silent> <Space>gs :Gstatus<CR>

"previm
"let g:previm_open_cmd = 'google-chrome'
" 指定すると:PrevimOpen後にvim再編集ができなかったのでコメントアウト
" 2013/10/13 17:05

"gocodeの設定
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

"sudo.vim
command! Ws :w sudo:%

"**************************
"localのvimrc
if filereadable(expand('~/.local.vimrc'))
    source ~/.local.vimrc
endif


function! Vgrep(str)
	let key = a:str
	execute 'vimgrep /' . l:key .'/ % | cw'
endfunction
command! -nargs=+ Vg :call Vgrep(<f-args>)


"colorscheme desertEx
"colorscheme newspaper
"colorscheme desert
colorscheme jellybeans
highlight Normal ctermbg=none

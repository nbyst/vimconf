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

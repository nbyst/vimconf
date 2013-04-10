author thinca
date   2012/05/27
place  yokohama.vim #3
font   VL ゴシック 26
font   Migu_2M:h38:cSHIFTJIS

# quickrun.vim の 詳解

2012/05/27 yokohama.vim #3
         thinca

## quickrun.vim とは

- プログラムを実行して
  結果を取得するための
  Vim プラグイン
- 拡張性重視
- 0.6.0 開発中
  - そろそろリリースしたい

### デモ

```ruby
(1...1000).select{ |i|
  i % 3 == 0 || i % 5 == 0
}.inject(:+).display
```

### quickrun.vim がしていること

1. config を構築する

2. コマンドを実行する

3. 結果を表示する

## 1. config を構築する
### config

- オプションの集合
- 実行毎に構築される
- 何を
- どのように実行し
- どのように結果を出力するのか
- などを決定する


### オプションの種類

- exec
  - 実行するコマンドの雛形
  - "%c %o %s %a"
- command → %c
- cmdopt  → %o
- args    → %a

### オプションの種類

- src
  - ソース文字列
- srcfile
  - ソースファイル
- input
  - 標準入力

### オプションの種類

- type
  - 設定の雛形の指定
- runner
  - 実行方法を指定する
- outputter
  - 出力方法を指定する

### 指定方法

- コマンドライン
- b:quickrun_config
- g:quickrun_config
- デフォルト値

上の方が優先

### type オプション

- g:quickrun_config と
  デフォルトの config は雛形の集合
- type で雛形を指定できる
- "_" は常に参照される

### config 構築例

先ほどの ruby の例

### config 構築例

1. コマンドの実行

    :QuickRun ruby

### config 構築例

2. コマンドラインの config を構築

    {'type': 'ruby'}

### config 構築例

3. 優先度順に config を参照

  1. b:quickrun_config
  2. 'filetype'
  3. g:quickrun_config.ruby ← type
  4. g:quickrun#default_conig.ruby ← type
  5. g:quickrun_config._
  6. g:quickrun#default_onig._

### config 構築例

完成した config (の一部)

    {
      'exec': '%c %o %s %a',
      'hook/eval/template': ' p proc {^@%s^@}.call',
      'outputter': 'buffer',
      'runner': 'vimproc',
      'runner/vimproc/updatetime': 500,
      'tempfile': '%{tempname()}',
      'type': 'ruby'
    }

## 2. コマンドを実行する

### オプションの種類 (再掲)

- type
  - 設定の雛形の指定
- runner  ← これ
  - 実行方法を指定する
- outputter
  - 出力方法を指定する

## コマンドの実行

- 使用する runner モジュールを
  runner オプションで指定する
- runner モジュールがコマンドを実行する

### モジュール?

### モジュール

- quickrun.vim はモジュール化されている

- モジュールはユーザが自由に追加できる

- 個別に配布することもできる

### モジュールの種類

- runner
  - コマンドを実行するモジュール
  - runner オプションで指定
- outputter
  - 結果を出力するモジュール
  - outputter オプションで指定
- hook
  - フックを実行するモジュール

### runner モジュール

実行は runner モジュールが行う

- system
  - system() を使って実行
- vimproc
  - vimproc を使って非同期実行
- shell
  - :! を使って実行

### runner モジュール

config で指定する

    :QuickRun -runner vimproc

    let g:quickrun_config._.runner = 'vimproc'

## 3. 結果を表示する

### outputter モジュール

出力は outputter モジュールが行う

- buffer
  - バッファに出力
- file
  - ファイルに出力
- quickfix
  - quickfix に出力

### outputter モジュール
- file
  - ファイルに出力

ファイル名の指定は?

### モジュールの config

- モジュールはそれぞれ
  独自の config を持っている

- モジュールの動作を制御できる

### モジュールの config の指定方法
- モジュール名と一緒に指定

    {
      'outputter': 'file:name=result.txt:append=1',
    }

    :QuickRun -outputter file:name=result.txt
    :QuickRun -outputter file:result.txt:1

### モジュールの config の指定方法
- config から指定

    {
      'outputter/buffer/filetype': 'html',
    }

    :QuickRun -outputter/buffer/filetype html

### モジュールの config の指定方法
- 省略も可能

    :QuickRun -buffer/filetype html
    :QuickRun -outputter/filetype html
    :QuickRun -filetype html

- 曖昧になるので注意
- 完全指定が優先

### 指定方法の違い

- モジュール名と一緒
  - 常に最優先
- config から指定
  - 上書き可能

## モジュールの作り方

### モジュールの種類

- runner
- outputter
- hook

### 共通事項

- モジュールは辞書
- 登録すると使える
  - autoload/quickrun/{kind}/{name}.vim
  - quickrun#module#register()

### outputter モジュールのサンプル
- outputter/file

```vim
" outputter 用の辞書の用意
" config が必要な場合はここで
" 初期値を指定する
let s:outputter = {
\   'name': 'file',
\   'kind': 'outputter',
\   'config': {
\     'name': '',
\     'append': 0,
\   },
\   'config_order': ['name', 'append'],
\ }
" name と kind は
" autoload/quickrun/outputter/file.vim
" に置いた場合は省略できる

" 初期化処理を行う
function! s:outputter.init(session)
  " self.config で設定された config を
  " 参照できるモジュールはセッション毎に
  " コピーされて、
  " self.config に直接設定値が入る
  let file = self.config.name
  if !self.config.append && filereadable(file)
    call delete(file)
  endif
  " 実行に必要な値は self に入れる
  " 名前の衝突を避けるため、
  " _ で始まる名前を使う
  let self._file = fnamemodify(file, ':p')
  let self._size = 0
endfunction

" 出力処理を行う
function! s:outputter.output(data, session)
  execute 'redir >> ' . self._file
  silent! echon a:data
  redir END
  let self._size += len(a:data)
endfunction

" 終了処理を行う
function! s:outputter.finish(session)
  echo printf('Output to "%s" (%d bytes)',
  \           self.config.name, self._size)
endfunction
```

### hook モジュール

quickrun.vim のあちこちで
任意の Vim script を実行できる

- 実行前とか
- 出力時とか
- 終了時とか

### hook モジュール

- 複数の hook のセットを
  1つのモジュールとして扱う

- 複数の hook ポイントで連携が可能

### hook モジュールのサンプル
- hook/time
- 実行時間を計る hook

```vim
" config の定義方法は全モジュール共通
" hook の場合、enable オプションが
" 常に存在する。
let s:hook = {
\   'config': {
\     'enable': 0,
\     'format': "\n*** time: %g ***",
\   },
\ }

" 実行直前に起動される hook
function! s:hook.on_ready(session, context)
  let self._start = reltime()
endfunction

" 完了時に起動される hook
function! s:hook.on_finish(session, context)
  let self._end = reltime()
  let time = str2float(reltimestr(
  \          reltime(self._start, self._end)))
  let text = printf(self.config.format, time)
  " 結果を出力する
  call a:session.output(text)
endfunction
```

## まとめ

- quickrun.vim は拡張しやすいように
  作られている

- モジュールなんかも簡単に作れる

- この後の時間で作ってみては?

## 質問攻めタイム
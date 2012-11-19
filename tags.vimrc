"vimの設定ではないけど、忘備録としてここに各言語でのtagsファイル生成コマンドを
"書いておく
"
"現在 (2012年 10月  9日 火曜日 21:15:53 JST )のところ
"生成したtagsファイルは原則$HOME/.tagsに追記保存するという想定
"ゆくゆくは~/.tagfiles/<プロジェクト名>.<拡張子>という形で実ファイル保存し、
"vim起動時にこれらのタグファイルが存在するディレクトリを指定して
"ディレクトリ内の全てのタグファイルを読み込めるようにしたい
"
"まず基本の生成コマンドの説明
"ctags -a -f ~/.tags -R [option] <project treeのroot path>
"
"-a はすでにファイルがあれば追記するというoption
" -f <filename> でtagfileの名前を指定できる
" -R は指定したpathから深い階層のソースファイルを再帰的に探る
"
"例: あるprojectAのphp 
"ctags -a -f ~/.tagfiles/projectA.php -R --langmap=PHP:.php.inc --php-types=c+f+d+v+i `pwd`
"
"*プロジェクトのディレクトリの中で実行するので`pwd`が効いてくる
"
"C-]		カーソル位置の単語をタグとみなしてジャンプ。
"C-t		直前のタグに戻る。
"g C-]		複数候補がある場合に選択→ジャンプ。
"C-w }		カーソル位置の単語の定義を、プレビューウィンドウで開く。
"C-w C-z		プレビューウィンドウを閉じる。(:pcと同じ)
"
"memo: Googleが提供する Google Tags (GTags) なんてのもあり。導入はちょっとメンドイけど、かなり速いみたい。
"おまけ
"
":tselect	現在のタグの一覧を表示
":tfirst		（タグが重複している場合）最初のタグへ
":tn		（タグが重複している場合）次のタグへ
":tp		（タグが重複している場合）前のタグへ
":tlast	（タグが重複している場合） 最後のタグへ
":tags		移動経路を確認
":tag	タグリストの前方にジャンプ。(:3tagなども可)
":tag [タグ名]		指定したタグにジャンプ。(:taと同じ)
":ptag [タグ名]	[タグ名]の定義をプレビューウィンドウで開く。

set tags=tags,.tags,~/.tags

"vimの設定ではないけど、忘備録としてここに各言語でのtagsファイル生成コマンドを
"書いておく
"生成したtagsファイルは原則$HOME/.tagfilesに保存するという想定
"
"まず基本の生成コマンドの説明
"ctags -a -f ~/.tagfiles/<tagfile name> -R [option] <project treeのroot path>
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

set tags=./tags,./.tags,~/.tagfiles/*


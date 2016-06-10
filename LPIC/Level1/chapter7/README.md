####    [Chapter7 シェル、スクリプト、データ管理 ]
- **内容**
  - **シェル環境のカスタマイズ**
  - **シェルスクリプト**
  - **データベースとSQL**
  
  
- **環境変数**
  - シェルから起動されるすべてのプロセスで有効となる変数
  - シェル変数
    - シェル内で有効な変数
  - exportコマンド
    - シェル変数をexportすることで環境変数になる
  - `envコマンド`、`printenvコマンド`
    - 設定されている環境変数が表示される
  - `setコマンド`
    - シェル変数と環境変数を表示


- シェルのオプション
(実行例)
```
# ls *.py
ez_setup.py  get-pip.py

# set -o noglob
# ls *.py
ls: cannot access *.py: No such file or directory

# set +o noglob
# ls *.py
ez_setup.py  get-pip.py
```

|オプション|説明         |
|:-----------|:------------|
|allexport|作成、変更した変数を自動的にエクスポート|
|emacs|emacs風のキーバインドにする|
|ignoreeof|Ctrl + D によってログアウトしないようにする|
|noclobber|出力リダイレクトによる上書きを禁止する|
|noglob|メタキャラクタを使ったファイル名を展開を向こうにする|
|vi|vi風のキーバインドにする|


- エイリアス機能
  -  コマンドとオプションとひとまとめにしたり、新しいコマンドのようにしたり、一連のコマンドを簡単にする
```
# alias ls='ls -l'

# ls
total 24
drwxr-xr-x.  6 root root  4096 Jun  1 10:02 CA
-rw-r--r--   1 root root 10240 Jan 21  2011 ez_setup.py
-rw-r--r--   1 root root   260 Jun  1 09:35 get-pip.py
drwxr-xr-x  18 root root  4096 Jun  1 09:54 letsencrypt

# alias lsless='ls -l | less'
# lsless

# unalias lsless
# unalias ls
```

**(# alias lsless='ls -l | less')の結果**
![Alt Text](https://github.com/yhidetoshi/Pictures/raw/master/Linux_Memo/ls-alias.png)


- bashの設定ファイル
  - シェルを起動するたびに、環境変数やエイリアス、関数などを定義するのは非効率なので、自動的に行う仕組み 
  - 設定ファイルは以下の通り


|ファイル|説明         |
|:-----------|:------------|
|/etc/profile|ログイン時に実行され、全ユーザから参照される|
|/etc/bash.bashrc|bash起動時に実行され、全ユーザから参照される|
|/etc/bashrc|~/.bashrcから参照される|
|~/.bash_profile|ログイン時に実行される|
|~/.bash_login|~/.bash_profileがない場合、ログイン時に実行される|
|~/.profile|~/.bash_profileも~/.bash_loginもない場合、ログイン時に実行される|
|~/.bashrc|bash起動時に実行される|
|~/.bash_logout|ログアウト時に実行される|

- シェルスクリプト
```
# cat lsld
echo "Hoge huga"
var="hhooggeee"
echo ${var}

# source lsld
Hoge huga
hhooggeee

# . lsld
Hoge huga
hhooggeee
```

- **execコマンド**
  - 起動しているプロセスが置きかわる
  - (ex) `zsh`を起動するとき、zshだとzshが起動して元のbashシェルは待機になる
  - (ex) `exec zsh`とすると、置きかわる(プロセスは待機せずにPIDが切り替わる)


- スクリプトに渡す引数
  - `0` : 正常終了
  - `0以外` : エラー
- testコマンド
  - ファイルに関する情報を取得する 

```
# cat iftest1.sh
if test -f testscript
then
   source ./testscript
else
   echo "testscript file not exist"
fi

# sh iftest1.sh
testscript file not exist

# sh iftest1.sh
#
```
下記のように書き換えることができる
```
# cat iftest2.sh

if [ -f testscript ]; then
  . ./testscript
  else echo "testscript file not exist"
fi
```

**case文による条件分岐**
```
# cat casetest.sh

case $1 in
  1) echo "January" ;;
  2) echo "February" ;;
  3) echo "March" ;;
  4) echo "April" ;;
esac
# sh ./casetest.sh 1
January

# sh ./casetest.sh 2
February
```
**for文による**

```
# cat fortest.sh
  for var in Redhat Ubuntu Debian
  do
      echo $var Linux
  done

# sh fortest.sh
Redhat Linux
Ubuntu Linux
Debian Linux
```

**seq文**
```
# cat seqtest.sh
for i in `seq 10 15`
do
  echo $i
done
[root@chef-client1 ~]# sh seqtest.sh
10
11
12
13
14
15
```

**while文**
```
# cat whiletest.sh
i=1
while [ $i -le 10 ]
do
  echo $i
  let i=i+1
done

# sh whiletest.sh
1
2
3
4
5
6
7
8
9
10
```

**read文**



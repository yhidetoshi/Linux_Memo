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


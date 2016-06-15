####    Chapter9  システム管理
- **内容**
  - **ユーザとグループ管理**
  - **ジョブスケジューリング**
  - **ローカライゼーションと国際化**


- ユーザアカウントと/etc/passwd

例:(/etc/passwd)
```
root:x:0:0:root:/root:/bin/bash
apache:x:48:48:Apache:/var/www:/sbin/nologin
jenkins:x:497:497:Jenkins Continuous Integration Server:/var/lib/jenkins:/bin/false
dbus:x:81:81:System message bus:/:/sbin/nologin
postgres:x:26:26:PostgreSQL Server:/var/lib/pgsql:/bin/bash
```
**読み方(左から順に)**
```
/ユーザ名/パスワード(暗号化)/UID/GID/GECOS(ユーザのフルネーム,その他の情報)/ホームディレクトリ/デフォルトシェル/


(*)`/etc/passwd`ファイルは一般ユーザでも読み出し可能なので、暗号化されていても時間をかければ解読可能
->`/etc/shadow`に格納する.これだとスーパーユーザしから読み出しできないのでセキュリティ強化になる
```

- グループアカウントと/etc/group

例(/etc/group)
```
root:x:0:
jenkins:x:497:
dbus:x:81:
postgres:x:26:
```
**読み方(左から順に)**
```
/グループ名/グループパスワード/GID/グループメンバ/
```
- グループ
  - プライマリーグループ(基本グループ)
  - サブグループ(参加グループ)
 
  
**コマンドを用いたユーザグループの管理**
- `useradd`コマンド
  - `useradd [option] ユーザ名` 

|option|説明         |
|:-----------|:------------|
|-c コメント|コメントフィールドを指定する|
|-d パス|ホームディレクトリを指定する|
|-s パス|ログインシェルを指定する|
|-g グループ名/GID|プライマリグループを指定する|
|-G グループ名/GID|プライマリグループ以外に所属するグループを指定する|

(例)
`# useradd -c "Test User" -d /home/test -s /bin/bash testuser`


- **usermodコマンド**
  - 既存のユーザアカウントを変更する
  - `useradd`コマンドと多くのオプションが共通している
  - `usermod [option] ユーザ名`
    - (ex) `# usermod -G hoge testuser`
      - -gオプションだとプライマリグループが変更される
      - -Gオプションだとプライマリー以外のグループが変更される

- **userdelコマンド**
  - `userdel [option] ユーザ名`
  - `-r`オプションでホームディレクトリも同時に削除する
  - (ex) `# userdel -r testuser`

- **passwordコマンド**
  - `passwd [option] [ユーザ名]`
    - `-l`オプション：パスワードをロックして一時的に無効化する
    - `-u`オプション：パスワードのロックを解除する

- **groupコマンド**
  - グループを指定してユーザを作成するときは、あらかじめグループを作成して、グループを作っておく
  - `# groupadd sales`

- **groupmodコマンド**
  - `groupmod グループ名`
    - `-g GID` : GIDを変更する
    - `-n グループ名` : グループ名を変更する

- **groupdelコマンド**
  - `groupdel グループ名`
  - グループを削除

- cron
  - `crontab [option]`
  - `分` `時` `日` `月` `曜日` `コマンド`

|option|説明         |
|:-----------|:------------|
|-e| エディタを使ってcrontabを編集する|
|-l|crontabファイルの内容を表示する|
|-r|crontabファイルを削除する|
|-u ユーザ名|ユーザ名を指定してcrontabファイルを編集する(rootユーザのみ)|


|フィールド|内容         |
|:-----------|:------------|
|分| 0-59までの整数|
|時|0-23までの整数|
|日|1-31までの整数|
|月|-12までの整数、もしくはjan-decまでの整数|
|曜日| |
|コマンド|実行するコマンド|

[crontabの例]
```
# backup(毎日23:10)
10 23 * * * /usr/local/backup

```

- **atコマンド**
  - 1回限りの実行スケジュール
  - `at [option]`
  - `at [-f ファイル名] 日時`

|フィールド|内容         |
|:-----------|:------------|
|-d|予約中のジョブをジョブ番号を指定して削除|
|-l|予約中のジョブを表示|
|-f|コマンドを記述したファイルを指定|

(ex)
```
af -f run_jobs 23:00
```

[at コマンドの日時指定書式]

|指定日時|書式         |
|:-----------|:------------|
|午後10時|22:00, 10pm|
|正午|noon|
|真夜中|midnight|
|今日|today|
|明日|tomorrow|
|3日後|now + 3 days|
|2週間後の22:00| 10pm + 2 weeks|


- cron/atのアクセス制御
  - `/etc/cron.allow`
    - このファイルに記述されたユーザのみがcronを利用できる
  - `/etc/crond.deny`
    - cron.allowファイルがなければ、このファイルに記述されてないユーザが利用できる 
  

- ローカライゼーション
  - 言語/地域/国に日付や書式を合わせること 

  
[文字コード]

|文字コード|説明         |
|:-----------|:------------|
|ASCII|7bitで表される基本的な128種類の文字|
|ISO-8859|ASCIIを拡張した8bitの文字コードで256種類の文字|
|UTF-8|Unicodeを使った文字コードで、1文字を1バイト〜6バイトで表す|
|EUC-JP|UNIX環境で標準的な日本語文字コード|
|シフトJIS|WindowsやMacOSで利用される日本語の文字コード|

- 文字コード変換コマンド
  - `iconv`コマンド 
  - `iconv [option] [入力ファイル名]`

|option|説明         |
|:-----------|:------------|
|-f 入力文字コード|変換前の文字コードを指定|
|-t 出力文字コード|変換して出力した文字コードを指定|
|-l|扱える文字コードを表示|

(ex) eucjpからutf8へ変換する
```
$ iconv -f eucjp -t utf8 hoge.euc.txt > hoge.utf8.txt
```

- タイムゾーン
  - `/usr/share/zoneinfo`以下のバイナリファイルに格納されている
  - タイムゾーンを日本にする場合
    - `# cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime`
    - `# ln -s /usr/share/zonefile/Asia/Tokyo /etc/localtime`
    - **環境変数TZ**で設定することもできる
    - `tzselectコマンド`：対話的に設定できる
    - `# tzconfigコマンド`
      - /etc/localtimeと/etc/timezoneの値をまとめて変更できる 




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

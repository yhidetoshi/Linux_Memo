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

/ユーザ名/パスワード(暗号化)/UID/GID/GECOS(ユーザのフルネーム,その他の情報)/ホームディレクトリ/デフォルトシェル/

```
(*)`/etc/passwd`ファイルは一般ユーザでも読み出し可能なので、暗号化されていても時間をかければ解読可能
->`/etc/shadow`に格納する.これだとスーパーユーザしから読み出しできないのでセキュリティ強化になる
```

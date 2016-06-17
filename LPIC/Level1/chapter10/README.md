####    [Chapter10  システム管理(2)]
- **内容**
  - **システムクロックの設定**
  - **システムログの設定**
  - **メール管理**
  - **プリンタ管理**

- クロック
  - ハードウェアクロック
    - コンピュータに内蔵された時計、電源がOFFでも常に動作している
  - システムクロック
    - カーネル内に存在する時計
  - 問題点 
    - Linux起動時にハードウェアクロックを参照して設定されるが、時間の経過とともにハードウェアクロッとシステムクロックに差が生じる

- `date`コマンド
  - システムクロックを参照して現在の日時が表示される 
  - (ex) 12月10日午後4時10分に設定するには
    - `# date 12101610`
  - 引数を `+` で始めると、指定した書式で表示する

|書式|説明         |
|:-----------|:------------|
|%Y|年|
|%m|月(01 - 12)|
|%d|日(01 - 31)|　
|%H|時(00 - 23)|
|%M|分(00 - 59)|
|%a|曜日(Sun - Sat)|
|%b|月名(Jan - Dec)|

```
# date "+%Y/%m/%d (%a)"
2016/06/16 (Thu)
```

- システムクロックをハードウェアクロックにセットする
  - `hwcloc`コマンドを使う 

[hwclocコマンドのオプション]

|書式|説明         |
|:-----------|:------------|
|-r|ハードウェアクロックを表示する|
|-w (--systohc)|システムクロックの時刻をハードウェアクロックに設定|
|-s (--hctosys)|ハードウェアクロックの時刻をシステムクロックに設定|


**NTP(Network Time Protocol)**

![Alt Text](https://github.com/yhidetoshi/Pictures/raw/master/Linux_Memo/ntp-image.png)


- **ntpdateコマンド**
  - 指定したタイムサーバから現在の時刻を取得する
  - `# ntpdate time.server.hoge.jp`

- NTPサーバの運用
  - 起動
    - `# /etc/init.d/ntpd start`
  - confファイル
    - `/etc/ntp.conf`
    - 複数書いておくと、複数のNTPサーバを仮想的なNTPサーバとして運用
      - ラウンドロビン
    
**syslog**

![Alt Text](https://github.com/yhidetoshi/Pictures/raw/master/Linux_Memo/syslog-image.png)


- syslogの設定
  - `/etc/syslog.conf`
    - **ファシリティ.プライオリティ 出力先** 
  - (設定例) syslog.conf
```
kern.*      /var/log/kernel
kern.err    @hoge
kern.err    /dev/console
*.emerg     *
```

**[ファシリティ]**

|ファシリティ|説明         |
|:-----------|:------------|
|auth, authpriv|認証システム(loginやsu)による出力|
|cron|cronによる出力|
|deamon|各種デーモンによる出力|
|kern|カーネルによる出力|
|lpr|印刷システムによる出力|
|mail|メールシステムによる出力|
|syslog|syslog機能による出力|
|local0〜local7|独自の設定|

**[プライオリティ]**

|プライオリティ|説明         |
|:-----------|:------------|
|emerg|危険的な状態|
|alert|早急に対処が必要|
|crit|危険な状態|
|err|一般的なエラー|
|warning|システムからの警告|
|notice|システムからの重要な通知|
|info|システムからの情報|
|debug|デバッグ情報|
|none|ファシリティは無効|

**[出力先]**

|表記|説明         |
|:-----------|:------------|
|ファイル名|ファイルに出力する|
|@host名|リモートホストにsyslodに出力する|
|ユーザ名|ユーザの端末に出力する|
|/dev/console|コンソールに出力する|
|*|すべてのユーザの端末に出力する|


- **loggerコマンド**
  -  ログメッセージを生成することができる
  -  (書式)
    - `logger [-p ファシリティ.プライオリティ] [-t タグ] メッセージ`  
      - `$ logger -p syslog.info -t Test "logger test message!"` 
    - ファシリティがsyslog、プライオリティがinfoであれば、メッセージは`/var/log/messages`に保存される 

- **wコマンド**
  - ログイン中のユーザとシステム情報も表示される 
```
# w

 22:45:56 up 7 days,  8:19,  2 users,  load average: 0.00, 0.00, 0.00
USER     TTY      FROM              LOGIN@   IDLE   JCPU   PCPU WHAT
vagrant  tty1     -                01Jun16 16days  0.15s  0.02s login -- vagrant
vagrant  pts/2    192.168.1.1      01Jun16  0.00s  1.05s  0.01s sshd: vagrant [priv]
```

- **lastlog**
  - `/var/log/lastlog`ファイルを参照して、ユーザごとに最近のログイン一覧を表示する
```
# lastlog
Username         Port     From             Latest
root                                       **Never logged in**
bin                                        **Never logged in**
daemon                                     **Never logged in**
adm                                        **Never logged in**
lp                                         **Never logged in**
```

|ログファイル|コマンド         |
|:-----------|:------------|
|/var/log/messages|less, tail, grepなど|
|/var/log/secure|less, tail, grepなど|
|/var/log/wtmp|last|last|
|/var/run/utmp|who, w|
|/var/log/lastlog|lastlog|


- ログファイルのローテーション
  - 古くなったログを切り分けて、ログファイルが肥大化するのを防ぐ機能 
    - **logrotateユーティリティ**が提供
  - (設定)
    - `/etc/logrotate.conf`ファイル 
(logrotate.conf)
```
#ローテーション周期を1週間
weekly

#バックアップログを4週間保存
rotate 4

#ローテーションさせたら、空のログファイルを作成
create

#ログファイルを圧縮
compress

#/var/log/wtmpファイルの設定
/var/log/wtmp {
  monthly                        ->ローテーション周期を1か月とする
  create 0664 root utmp          ->パーミッションと所有者の設定
  create1                        ->バックアップログを1つ保存
```

![Alt Text](https://github.com/yhidetoshi/Pictures/raw/master/Linux_Memo/log-lotation.png)



- メール管理
  - **MTA(Message Transfer Agent)**
  - **MDA(Mail Delivery Agent)**
  - **MUA(Mail User Agent)**
  
![Alt Text](https://github.com/yhidetoshi/Pictures/raw/master/Linux_Memo/mail-flow.png)

一旦、メモのベタ貼り
```
・iptables設定
#ufw status | enable | disable

sshのデーモンは『ssh』
サービス起動は/etc/init.d/hoge start | stop | status
※service プロセス名 stop | start　も利用できる。

・nginxをインストール
#apt-get update
#apt-get install nginx

・パッケージ確認
#dpkg -l | grep hoge

・プロセスの自動起動
#sysv-rc-conf サービス名 on/off
※apt-get install sysv-rc-conf　でインストールしてから利用できる。

・NICの設定
-----
固定IP設定

/etc/network/interfacesに記述
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
address 192.168.xxx.xxx
netmask 255.255.255.0
gateway 192.168.1.1
-----

・DNS設定
ubuntuでは直接/etc/resolv.confを編集してはダメなので
/etc/resolvconf/resolv.conf.d/baseファイルを編集する
---
nameserer 8.8.8.8
---
#sudo resolvconf -u
→再読み込み

・Pv6無効化
-----
ついでにIPv6も無効化しておく
/etc/sysctl.confに以下記述
(lubuntuなので以下の記述は検索でヒットするubuntuとはほんのちょっと場所が違った)
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
再読み込み
sudo sysctl -p
------

・sshdのコンフィグ場所
→ /etc/ssh/sshd_config

・Nginx
ファイルの場所：/etc/nginx配下
http://blog.kondoyoshiyuki.com/2012/12/09/setting-1-nginx-on-ubuntu-12-04/

・ログ
CentOSと同じ：/var/log配下

・MySQL
----
sudo apt-get install mysql-server
$ mysql --version
mysql  Ver 14.14 Distrib 5.5.37, for debian-linux-gnu (x86_64) using readline 6.2
設定
設定ファイルはバックアップしておきましょう

$ cd /etc/mysql
$ cp my.cnf my.cnf.org
文字コードなどを設定

$ sudo vi my.cnf
下記を追記

[client]
default-character-set = utf8

[mysqld]
skip-character-set-client-handshake
character-set-server  = utf8
collation-server      = utf8_general_ci
init-connect          = SET NAMES utf8
設定を反映させるためmysqlを再起動

$ sudo service mysql restart

$ sudo service mysql start
$ sudo service mysql stop
$ sudo service mysql restart
----
```

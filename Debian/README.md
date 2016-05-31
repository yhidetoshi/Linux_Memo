![Alt Text](https://github.com/yhidetoshi/Pictures/raw/master/Linux_Memo/debian-image.png)

環境:Debian8.4 64bit on VirtualBox


- Debianのisoイメージの取得
  - https://www.debian.org/ からダウンロード
  - https://www.debian.org/CD/http-ftp/#stable(安定板)
    - DVD amd64をクリック(ハードウェアにあうものをインストール)
    - 3枚あるが1枚目だけでもOK


#### インストール後のセットアップメモ

- apt-getでパッケージをインストールできるようにする
```
vi /etc/apt/sources.list
# ↓下記の行をコメントアウトすることで、CD, DVDへの読み込みを回避
# deb cdrom:[Debian GNU

deb http://cdn.debian.net/debian/ jessie main contrib non-free
deb http://cdn.debian.net/debian/ jessie-updates main contrib non-free
deb http://security.debian.org/ jessie/updates main contrib non-free

を追加

#aptitude update
このコマンド以降、リポジトリの設定が反映されてapt-getでinstallできるよになる。
```

- GNOMEをインストールする
```
# apt-get update
# apt-get install task-gnome-desktop
```



- コマンドメモ
```
### sshをインストールする
# aptitude install ssh
# systemctl {start | stop | restart } ssh

### iptablesの再起動
# /etc/init.d/netfilter-persistent restart

### Debianのバージョンを確認する
# cat /etc/debian_version

```



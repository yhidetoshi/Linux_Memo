![Alt Text](https://github.com/yhidetoshi/Pictures/raw/master/Linux_Memo/linux-command.png)


<a id="index"></a>
## <a href="#index">目次</a>
* [プロセス周り](#anchor1)
* [サービス周り](#anchor2)
* [yumコマンド周り](#anchor3)
* [ディスク周り] (#anchor4)
* [Network周り] (#anchor6)
* [OpenSSLコマンド] (#anchor7)
* [パーミッション] (#anchor8)

====

<a id="anchor1"></a>
#### <a href="#anchor1">プロセス周り</a>  
|コマンド    |機能         |
|:-----------|:------------|
|top|稼働中のプロセスをリアルタイム表示|
|ps -ef &#124; grep &lt;ps_name&gt;|プロセス確認|
|kill -9 &lt;ps_num&gt;|プロセスを止める(通常)|
|kill -KILL &lt;ps_num&gt;|プロセスを止める(強制)|

<a id="anchor2"></a>
#### <a href="#anchor1">サービス周り</a>  

====
|コマンド    |機能         |
|:-----------|:------------|
|servie &lt;service_name&gt; start &#124; stop &#124; restart|起動,停止,再起動|
|chkconfig &lt;service_name&gt; on &#124; off|自動起動登録/解除|
|chkconfig --list &lt;service_name&gt;|自動起動確認|


<a id="anchor3"></a>
#### <a href="#anchor3">yumコマンド周り</a>  

|コマンド    |機能         |
|:-----------|:------------|
|yum install &lt;package_name&gt; stop restart|インストール|
|yum remove &lt;package_name&gt;|アンインストール|
|yum list &lt;package_name&gt;|インストール可能リスト|
|yum check-update &lt;package_name&gt;|アップデート確認|
|yum info &lt;package_name&gt;|パッケージ情報を確認|
|yum clean &lt;package_name&gt;|古いヘッダ削除|


<a id="anchor4"></a>
#### <a href="#anchor3">ディスク周り</a>  
====
|コマンド    |機能         |
|:-----------|:------------|
|df -a|ファイルシステムの情報表示|
|df -h|容量表示(適当)|
|df -k|容量表示(K byte)|


- mount( `mount [option…] device directory` ) 
  - (ex) mount -t <original_mount_dir> <target_mount_dir>
  - (ex) CD-ROMをマウント : `# mount -r -t iso9660 /dev/cdrom /mnt/cdrom`
  -  オプション
    - タイプを指定(-t) : `# mount -t`  
    - 読み込み専用マウント : `# mount -r`
  
  - 主なファイルシステム・タイプ
    - ext2 : `Linux標準のファイルシステム`
    - ext3 : `ext2にジャーナリング機能を付加したファイルシステム`
    - xfs : `ジャーナリング機能を持ったファイルシステム`
    - iso9660 : `一般的なCD-ROMの形式`
    - udf : `主にDVDに使用`
    - nfs : `ネットワークファイルシステム`
    - samba : `Windowsのネットワーク共有ファイルシステム`

  - 自動マウント(fstab)
    - OS再起動した場合に自動でマウントさせるための設定 
    - `/etc/fstab`に書く
    - fstabの読み方
    ```
1列目 : デバイス名 
2列目 : マウントポイント 
3列目 : ファイルシステム 
4列目 : マウント時のオプション 
5列目 : ファイルシステムをdumpする必要があるか否かの指定「0」または無記述の場合はdump不要のファイルシステムとなる
6列目 : システム起動時にfsckチェックを行うか否かの指定,「0」の場合はチェックを行わない。ルートファイルシステム
でチェックを行う場合は1を指定する.ルートファイルシステム以外でチェックを行う場合は2を指定
    ```

※ ジャーナリング
 - ファイル処理中に何らかの障害が発生した場合に短時間で復旧できるような手がかり（ログ）を残すファイル管理手法




<a id="anchor6"></a>
#### <a href="#anchor6">Network周り</a>  
====
- network再起動 : `service network restart`


<a id="anchor7"></a>
#### <a href="#anchor7">OpenSSLコマンド</a> 
- 任意の文字列をハッシュ化
```
openssl passwd -1 '<hash化したい文字列>
```


<a id="anchor8"></a>
#### <a href="#anchor8">OpenSSLコマンド</a> 
- 任意の文字列をハッシュ化
```
openssl passwd -1 '<hash化したい文字列>
```
====


#### sedコマンド

  - repoの無効化 : `sed -i -e "s/enabled *= *1/enabled=0/g" /etc/yum.repos.d/epel.repo`

#### sudo コマンド
一般ユーザがパスワードなしでsudo実行
```
user_name  ALL=(ALL)       NOPASSWD:ALL
```


- 環境変数の確認
`$ echo $PATH`

もし表示結果に/usr/local/binがなければ追加する

環境変数にパスを追加
`$ echo export PATH='/usr/local/bin:$PATH' >> ~/.bash_profile`
export PATH=/usr/local/bin:$PATHをUser/ユーザー名/.bash_profileに書き込んでいる。


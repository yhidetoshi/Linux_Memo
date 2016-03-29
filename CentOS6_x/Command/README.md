
#### プロセス周り
====

|コマンド    |機能         |
|:-----------|:------------|
|top|稼働中のプロセスをリアルタイム表示|
|ps -ef grep &lt;ps_name&gt;|プロセス確認|
|kill -9 &lt;ps_num&gt;|プロセスを止める(通常)|
|kill -KILL &lt;ps_num&gt;|プロセスを止める(強制)|







#### サービス周り
====

|コマンド    |機能         |
|:-----------|:------------|
|servie &lt;service_name&gt; start stop restart|起動,停止,再起動|
|chkconfig &lt;service_name&gt; on|自動起動登録|
|chkconfig &lt;service_name&gt; off|自動起動解除|
|chkconfig --list &lt;service_name&gt;|自動起動確認|

#### yumコマンド周り
====

|コマンド    |機能         |
|:-----------|:------------|
|yum install &lt;package_name&gt; stop restart|起動/停止/再起動|
|chkconfig &lt;service_name&gt; on|自動起動登録|
|chkconfig &lt;service_name&gt; off|自動起動解除|
|chkconfig --list &lt;service_name&gt;|自動起動確認|



- install : `# `
- uninstall : `# yum remove <package_name>`
- install可能リスト : `# yum list <package_name>`
- update確認 : `# yum check-update <package_name>`
- package情報表示 : `# yum info <package_name>`
- 古いヘッダ削除 : `# yum clean <package_name>`


#### ディスク周り
====
- dfコマンド
  - ファイルシステムの情報表示 : `# df -a`
  - 容量表示(適当) : `# df -h`
  - 容量表示(K byte) : `# df -k`

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

#### Network周り
====
- network再起動 : `service network restart`


#### パーミッション周り
====


#### sedコマンド

  - repoの無効化 : `sed -i -e "s/enabled *= *1/enabled=0/g" /etc/yum.repos.d/epel.repo`


#### vimコマンド

|コマンド    |機能         |
|:-----------|:------------|
|^|行の先頭へ移動|
|gg|ファイルの先頭行移動|
|G|ファイルの最後の行に移動|
|shift + w|スペース区切りで次の単語の先頭へ移動|
|shift + b|スペース区切りで前の単語の先頭へ移動|
|shift + e|スペース区切りで次の単語の末尾へ移動|


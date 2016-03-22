
#### プロセス周り
====
- 稼働中のプロセスをリアルタイム表示 : `# top`
- プロセス確認 : `# ps -ef | grep <ps_name>`
- プロセスを止める(通常) : `# kill -9 <ps_num>`
- プロセスを止める(強制) : `# kill -KILL <ps_num>`

#### サービス周り
====
- 起動/停止/再起動 : `# servie <service_name> start|stop|restart `
- 自動起動登録/解除 : `# chkconfig <service_name> on | off`

#### yumコマンド周り
====
- install : `# yum install <package_name>`
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
    - 
  
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


#### パーミッション周り
====


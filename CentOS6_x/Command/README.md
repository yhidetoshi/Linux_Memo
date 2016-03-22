
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



- mount


#### Network周り
====


#### パーミッション周り
====


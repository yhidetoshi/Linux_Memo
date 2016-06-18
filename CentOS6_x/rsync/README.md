### rsyncしてリポジトリを取得するときのメモ


- **(参考)rsyncのコマンド等**
  - CentOS の RPM リポジトリのミラーサーバを構築する`
    - http://goo.gl/VyB9Y


**[IIJのftpサーバにrsyncする(CentOS6.8)]**

コマンド：`# rsync -rptv --delete rsync://ftp.iij.ad.jp/pub/linux/centos/6.8/os/x86_64/ ./test2/`
```
rsync: connection unexpectedly closed (0 bytes received so far) [receiver]
rsync error: error in rsync protocol data stream (code 12) at io.c(600) [receiver=3.0.6]
```

**[IIJのftpサーバにrsyncする(CentOS7.0)]**

コマンド：`# rsync -rptv --delete rsync://ftp.iij.ad.jp/pub/linux/centos/7/os/x86_64/ ./test2/`
```
rsync: connection unexpectedly closed (0 bytes received so far) [receiver]
rsync error: error in rsync protocol data stream (code 12) at io.c(600) [receiver=3.0.6]
```


**[Jaistのftpサーバにrsyncする(CentOS6.8)]**

コマンド：`# rsync -rptv --delete rsync://ftp.jaist.ac.jp/pub/Linux/CentOS/6.8/os/x86_64/ ./test/`
```
Welcome to JAIST Public Mirror Service (ftp.jaist.ac.jp).

If you have any issues or comments, please contact the mirror admins via e-mail at ftp-admin@jaist.ac.jp.

*DISCLAIMER* JAIST is not liable for any use, storage or transmission of any files stored on this archive. This archive is provided as a free service to the public and all files are provided *as is*.

We banned the following addresses because they established multiple connections simultaneously. You should contact ftp-admin@jaist.ac.jp if you want us to cancel your ban.

103.18.1.145, 219.249.189.12

receiving incremental file list
./
.discinfo
.treeinfo
CentOS_BuildTag
EULA
GPL

(省略)

```

**[Rikenのftpサーバにrsyncする(CentOS6.7)]**

コマンド：`# rsync -rptv --delete rsync://ftp.riken.jp/Linux/centos/6/os/x86_64/ ./test2/`
```
******************************************************
ftp.riken.jp is an unsupported ftp/http/rsync
service of RIKEN Nishina Center for research support.
Use entirely at your own risk - no warranty
is expressed or implied.
Complaints and questions should be sent to
ftp-admin a.t. ftp.riken.jp
******************************************************

@ERROR: Unknown module 'Linux'
rsync error: error starting client-server protocol (code 5) at main.c(1503) [receiver=3.0.6]
```

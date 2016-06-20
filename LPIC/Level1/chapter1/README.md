##Chapter1 システムアーキテクチャ
- **内容**
  - **ハードウェアの基本知識と設定**
  - **システムの起動**
  - **ランレベルとシャットダウン**

####ハードウェアの基本知識と設定
  
- デバイスの確認
  - `/proc`配下のファイルで確認できる

|ファイル名  |説明         |
|:-----------|:------------|
|/proc/bus/usb/devices|USBデバイス情報|
|/proc/cpuinfo|CPUに関する情報|
|/proc/meminfo|メモリに関する情報|
|/proc/interrupts|IRQ情報|
|/proc/pci/devices|PCIデバイスの情報|
|/proc/scsi/scsi|SCSIデバイスの情報|
|/proc/dma|使用中のDMAチャネルの情報|
|/proc/ioports|I/Oアドレスの情報|
|/proc/dma|DMAチャンネルに関する情報|
|/proc/cmdline|システム起動時にブートローダからカーネルに渡されたパラメータが確認できるファイル|


**[USBデバイスクラス]**

|デバイスクラス  |デバイス         |
|:-----------|:------------|
|HID(Human Interface Device)|キーボード、マウスなど|
|Mass Storage Class|ハードディスク、USBメモリなど|
|ACM Communication Device Class|モデム、TAなど|
|Audio Class|スピーカー、マイクなど|

- **USBの特徴**
  - USBコントローラは最大127台のUSBデバイスを制御できる
  - ホットプラグ
  - 電源供給
  - USB1.1規格はカーネル2.4からサポート
  - USB2.0規格はカーネル2.6からサポート

**[USBコントローラ、USB規格、モジュール]**

|コントローラー|規格|USBモジュール(カーネル2.4)|USBモジュール(カーネル2.6)|
|:-----------|:------------|:------------|:------------|
|UHCI|USB1.1|usb-uhci|uhci-hdc|
|OHCI|USB1.1|usb-ohci|ohci-hdc|
|EHCI|USB2.0|サポートしてない|ehci_hcd|

- Linuxはハードウェアへのアクセスを抽象化するデバイスファイルを持っている
(一部抜粋)
```
# ls /dev/
MAKEDEV          hvc0    mcelog              ram13   sda1      tty13  tty29  tty44  tty6       vcs1
block            input   mem                 ram14   sdb       tty14  tty3   tty45  tty60      vcs2
bsg              kmsg    net                 ram15   sdb1      tty15  tty30  tty46  tty61      vcs3
char             log     network_latency     ram2    sg0       tty16  tty31  tty47  tty62      vcs4
        ..........
```

- **D-Bus(Desktop Bus)**
  - プログラム同士が情報を伝達するプロセス間通信機構の一つ 

- UEFI(Unified Extensible Firmware Interface)
  - IntelがBIOSを置き換えるために考案したEFIの統一仕様
  - GUI操作サポート
  - ファームウェアが使用可能なメモリ量の上限を緩和
  - BIOSよりも高機能

- **modprode**
  - 依存関係を考慮してカーネルモジュールをロード、アンロードする 

- USBデバイスの情報を確認
  - `lsusb`コマンド 
- PCIデバイスの情報を確認
  - `lspci`コマンド 
  - `cat /proc/bus/pci/devices`

- カーネルログ
  - `/var/log/messages` 
 
- **カーネルモジュールを確認**
  - `lsmod`コマンドを使う
  - `cat /proc/modules`

```
# lsmod
Module                  Size  Used by
vboxsf                 37631  1
sunrpc                262864  1
ipv6                  317340  41
dm_mod                 84209  0
video                  20674  0
output                  2409  1 video
sg                     29350  0
vboxguest             257571  2 vboxsf
virtio_net             17080  0
ext4                  374902  1
jbd2                   93427  1 ext4
mbcache                 8193  1 ext4
sd_mod                 39069  4
crc_t10dif              1541  1 sd_mod
ahci                   42215  2
virtio_pci              6985  0
virtio_ring             8917  2 virtio_net,virtio_pci
virtio                  4977  2 virtio_net,virtio_pci
```

####システムの起動

(起動順)：`[BIOS] -> [ブートローダ] -> [カーネル] -> [init]`

- システムの起動の流れ(上から下の順で実行される)
  - **BIOS**
    - ハードウェアの初期化
    - 記憶装置(HDD)等に関して最低限の認識を行う
    - ブートセクタの読み出し
    - ブートローダへ制御を移す
  - **ブートローダ** 
    - ハードウェア上からカーネルをメモリ上へ読み込む
  - **カーネル**
    - 高度にハードウェアを認識、制御し、ルートパーティションのマウントなど様々な初期化を行う 
    - メモリの初期化
    - システムクロックの設定
    - initプログラムを実行
  - **init**
    - システムの初期化スクリプトを実行
    - 設定ファイル「/etc/initab」の記述に基づいて、自動起動するべきプロセスを立ち上げるなど、アプリケーションレベルの初期設定を行う
    - 最初に起動されるプロセスでPIDは1
      - Upstartの特徴
        - サービスやタスクを「ジョブ」単位で扱う
        - サービスの並列起動処理が可能
        - イベント駆動型

- システム起動時においてのBIOSの説明
  - MBRを読み込んで、得られたブートローダに制御を移す
  - 記憶装置(HDD)等に対して最低限の認識を行う


- ルートパーティションを`/dev/sda5`に指定して起動する
  -　`grub append> ro root=/dev/sda5` 


- 起動時のイベント確認
  - `dmseg`コマンド
    - システムの起動時にどのような処理が行われたかを確認できる

####ランレベルとシャットダウン

- **wallコマンド**
  - ログインユーザに通知するコマンド

- **telinit/initコマンド**
  - ランレベルを切り替えるコマンド 

- ランレベルの種類
  - ランレベル毎にどのようなサービスが稼働するか、しないかを決定することができる 

- **[systemctlコマンド]**
  - `systemctl [sub_command] [サービス名]`  

|サブコマンド  |用途         |
|:-----------|:------------|
|disable|サービスの自動起動を無効にする|
|enable|サービスの自動起動を有効にする|
|get-default|次回起動時のターゲットを表示する|
|halt|システムを停止してhalt状態にする|
|is-active|サービスが稼働しているかを表示する|
|list-unit-files|すべてのUnit定義ファイルを一覧を表示する|
|reboot|システムを再起動する|
|reload|サービスの設定ファイルを再読み込みする|
|restart|サービスを再起動する|
|set-default|次回起動時のターゲットを設定する|
|start|サービスを起動する|
|stop|サービスを停止する|
|poweroff|システムを停止し電源を切断する|

- **systemd**
  - systemdはSysVinitを置き換える新しいinitの仕組み
  - 管理単位のユニット
  
|拡張子  |機能         |
|:-----------|:------------|
|device|各種デバイスを管理するUnit|
|mount|ファイルシステムのマウントを管理する|
|service|サービスを制御するUnit|
|swap|スワップ領域を管理するUnit|
|target|複数のサービスを1つのグループにするためのUnit|

|プロセス名  |機能         |
|:-----------|:------------|
|systemd|systemdの本体となるプロセスで、initの代わりに常駐する|
|systemd-journald|systemdが制御する、各サービスが出力するログを扱う|
|systemd-logind|システムへのログイン、起動停止、電源ボタン操作などを管理する|
|systemd-udevd|従来のudevdに代わり、デバイスの動的変更、検出を行う|

|拡張子|機能|
|:-----------|:------------|
|device|各種デバイスを管理するUnit|
|mount|ファイルシステムのマウントを管理するUnit|
|service|サービスを制御するUnit|
|swap|スワップ領域を管理するUnit|
|target|複数サービスを1つのグループにするためのUnit|


**[Redhat系]**

|ランレベル  |説明         |
|:-----------|:------------|
|0|停止|
|1|シングルユーザモード|
|2|マルチユーザモード|
|3|マルチユーザモード|
|4|未使用|
|5|マルチユーザモード(グラフィカルログイン)|
|6|再起動|
|Sまたはs|シングルユーザモード|


**[Debian系]**

|ランレベル  |説明         |
|:-----------|:------------|
|0|停止|
|1|シングルユーザモード|
|2|マルチユーザモード|
|3|マルチユーザモード|
|4|マルチユーザモード|
|5|マルチユーザモード(グラフィカルログイン)|
|6|再起動|
|Sまたはs|シングルユーザモード|


**[ランレベル、ターゲット]**

`/etc/systemd/system/default.target`

|ランレベル  |説明         |
|:-----------|:------------|
|0|poweroff.target|
|1|rescue.target|
|2,3,4|multi-user.target|
|5|graphical.target|
|6|reboot.target|


- シングルユーザモード
  - rootユーザだけが利用できる状態
 
- ランレベルを表示
  - `runlevel`コマンドを使う
```
# runlevel
N 3
```
- ランレベルの変更
  - `init`コマンド
  - `telinit`コマンド
```
# init 1
```

- デフォルトのランレベルの設定
  - `/etc/initab` 
 
**[シャットダウンコマンドのオプション]**

|オプション  |説明         |
|:-----------|:------------|  
|-h|シャットダウン完了後にシステムを停止する|
|-r|シャットダウン完了後にシステムを再起動する|
|-f|次回起動時にfsckをスキップする|
|-F|次回起動時にfsckを必ず実行する|
|-k|実際にシャットダウンせずに警告メッセージを通知する|
|-c|実行中のシャットダウンをキャンセする|


- 警告メッセージを出す
```
# shotdown -k now "please logout immidiately"
```

- 22時にシステムを停止する
```
# shutdown -h 22:00
```

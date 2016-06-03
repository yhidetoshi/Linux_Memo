####    [Chapter1 システムアーキテクチャ](https://github.com/yhidetoshi/Network_Study/tree/master/NA-ver/chapter1/)
- **内容**
  - **ハードウェアの基本知識と設定**
  - **システムの起動**
  - **ランレベルとシャットダウン**
  
- デバイスの確認
  - `/proc`配下のファイルで確認できる

|ファイル名  |説明         |
|:-----------|:------------|
|/proc/bus/usb|USBデバイス情報|
|/proc/cpuinfo|CPU情報|
|/proc/interrupts|IRQ情報|
|/proc/pci|PCIデバイスの情報|
|/proc/scsi/scsi|SCSIデバイスの情報|

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


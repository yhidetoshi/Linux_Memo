####    [Chapter1 システムアーキテクチャ](https://github.com/yhidetoshi/Network_Study/tree/master/NA-ver/chapter1/)
- **内容**
  - **ハードウェアの基本知識と設定**
  - **システムの起動**
  - **ランレベルとシャットダウン**

####ハードウェアの基本知識と設定
  
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

- USBデバイスの情報を確認
  - `lsusb`コマンド 
- PCIデバイスの情報を確認
  - `lspci`コマンド 

 
- **カーネルモジュールを確認**
  - `lsmod`コマンドを使う 

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

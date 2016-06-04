##Chapter2 Linuxのインストールとパッケージ管理
- **内容**
  - **ハードウェアディスクのレイアウト設計**
  - **ブートマネージャのインストール**
  - **共有ライブラリ管理**
  - **Debianパッケージの管理**
  - **RPMパッケージの管理**



####Linuxインストールに必要なパーティション

- スワップ領域
  - メモリサイズと同程度〜2倍程度のサイズを割り当てる
- 用途が異なるディレクトリは別のパーティションを配置するようにする

####ブートマネージャのインストール

- ブートマネージャー
  - **MBR(マスターブートレコード)**から起動プログラムを読み込む
    - 第一段階のブローダ
    - 第二段階のブローダ
      - MBRのサイズが小さいために2段階に分けている
  - 代表的なブローダ
    - **GRUB**
    - **LILO**


- **GRUB**
  - 多機能ブートローダ
    - 多数のファイルシステムを認識可能
    - シェル機能を搭載し、コマンドによる高度な管理が可能
    - `grub-install`コマンド

[/dev/sdaのMBR領域にGRUBをインストール]
```
# grub-install /dev/sda
```

- GRUBの設定ファイル
  - `/boot/grub/menu.lst` 

`# cat /boot/grub/menu.lst`
```
default=0
timeout=0
hiddenmenu
title CentOS (2.6.32-431.3.1.el6.x86_64)
	root (hd0,0)
	kernel /boot/vmlinuz-2.6.32-431.3.1.el6.x86_64 ro root=UUID=1d798f26-8ace-413f-9530-2d1d1d4fdbb5 rd_NO_LUKS  KEYBOARDTYPE=pc KEYTABLE=us LANG=en_US.UTF-8 clocksource_failover=acpi_pm rd_NO_MD SYSFONT=latarcyrheb-sun16 crashkernel=auto rd_NO_LVM rd_NO_DM
	initrd /boot/initramfs-2.6.32-431.3.1.el6.x86_64.img
```

- **LILO**
  - Intelアーキテクチャ用のブローダ
  -　**ブローダ**
    - BIOSによって実行され、Linuxカーネルや他のOSをメモリ上に読み混む役割
  - **マップインストーラ**
    - ブートセクタを更新
    - マップファイルを作する
    - `/sbin/lilo`
  - **マップファイル**
    - ディスク上の物理的なカーネルの位置を記録したファイル 
  - **LILO設定ファイル**
    - `/etc/lilo.conf`

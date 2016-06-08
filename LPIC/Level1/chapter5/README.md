####    Chapter5 デバイスとLinuxファイルシステム
- **内容**
  - **パーティションとファイルシステムの作成**
  - **ファイルシステムの管理**
  - **ファイルシステムのマウントとアンマウント**
  - **ディスククォータの管理**
  - **ファイルの配置と検索**


- **IDE**
  - ひと昔前まで、一般のPCやサーバなどにおいて主流の形式だったもの
  -　**プライマリー**
    -　**マスター**
  - **セカンダリ**
    - **スレーブ** 

![Alt Text](https://github.com/yhidetoshi/Pictures/raw/master/Linux_Memo/ide-image.jpg)


- ハードディスク
  - **SATA**(Sirial ATA)
    - ほとんどのPCで標準的に搭載されている
  - **SAS**(Sirial Attached SCSI)
    - SATAよりも高速で信頼性も高いく、高価
  - **SCSI**
    - SCSI
      - ハードディスクやDVDドライブ、テープドライブなど、様々な周辺機器を接続するための規格
      - 高価で一般的に高速。拡張性も高い

**主なデバイスファイル**

|デバイスファイル|説明         |
|:-----------|:------------|
|/dev/sda|1番目のHD|
|/dev/sdb|2番目のHD|
|/dev/sdc|3番目のHD|
|/dev/sdd|4番目のHD|
|/dev/sr0|1番目のCD/DVDドライブ|
|/dev/st0|1番目のテープドライブ|


- パーティション
  - **基本パーティション**
    - ディスクには最大4個の基本パーティションを作成することができる
    - /dev/sda1〜4
  - **拡張パーティション**
    - 基本パーティションの1つを拡張パーティションにすることができる
    - 拡張パーティションの中にファイルシステムではなく、論理パーティションが格納される
  - **論理パーティション**
    - 拡張パーティション内に作成されたパーティションのこと
    - 論理パーティションのデバイスファイル名は、作成済み基本パーティションの数にかかわらず、/dev/sda5以降になる
    
![Alt Text](https://github.com/yhidetoshi/Pictures/raw/master/Linux_Memo/disk-partition.png)


**[rootファイルシステム]**

![Alt Text](https://github.com/yhidetoshi/Pictures/raw/master/Linux_Memo/filesystem-root.png)



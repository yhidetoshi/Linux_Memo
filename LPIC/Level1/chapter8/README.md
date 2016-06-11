####    [Chapter8 ユーザインターフェースとデスクトップ]
- **内容**
  - **Xのインストール**
  - **ディスプレイマネージャーとウィンドウマネージャー**
  - **アクセシビリティ**


- **X Window System**
  - GUIを実現するために`X Window System(X, X11)`が使われている 
  - **X.Org** : XFree86から派生したシステム

![Alt Text](https://github.com/yhidetoshi/Pictures/raw/master/Linux_Memo/x-server-client.jpg)


- X.Orgの設定
  - `/etc/X11/xorg.conf`
  - `Xorg -configure`
    - xorg.confファイルを自動生成する
  - `X -config <path_to_file>`
    - テストを実施
  - **xvidtuneコマンド**
    - ビデオモードの詳細設定 

|セクション　|説明         |
|:-----------|:------------| 
|ServerLayout|入出力デバイスとスクリーンの指定|
|Files|フォントやカラーデータベースファイルのパス名|
|Module|ダイナミックモジュールの設定|
|inputDevice|キーボードやマウスなどの入力装置|
|Monitor|モニターの設定|
|Device|ビデオカードの設定|
|Screen|ディスプレイの色深度(表示色数)や画面サイズ設定|


- ネットワーク経由でのX利用
  - xhostコマンドを利用する
    - `xhost [+-][ホスト名]` 

|オプション　|説明         |
|:-----------|:------------| 
|+ホスト名|指定したホストをXサーバ接続許可リストに追加する|
|-ホスト名|指定したホストをXサーバ接続許可リストから削除する|
|+|すべてのホストがXサーバに接続することを許可する(アクセス制御は無効)|
|-|Xサーバ接続許可リストによるアクセス制御を有効にする|

1. リモートPCのXクライアントがローカルPCのXサーバを利用できるように許可する
  - `$ xhost +remotepc`
2. リモートPCの環境変数DISPLAYでXサーバを指定し、環境変数DISPLAYをエクスポートする
   -  `$ DISPLAY=localpc:0`
   -  `$ export DISPLAY`

(書式)[ホスト名]:ディスプレイ番号
3.  リモートPC側でXクライアントを起動
   -  `$rxvt &`  

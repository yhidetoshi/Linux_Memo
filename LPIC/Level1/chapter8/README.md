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


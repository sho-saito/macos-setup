# BetterTouchTool 設定

このディレクトリには、効率的なウィンドウ管理と生産性向上のためのBetterTouchToolプリセットが含まれています。

## ファイル

### keyboardshortcuts.bttpreset

「Window Management Shortcuts」という名前の包括的なキーボードショートカットプリセットで、以下の機能を提供します：

#### ウィンドウ管理
- **画面4分の1配置**
  - `Cmd + Ctrl + Shift + ←`: 左上4分の1
  - `Cmd + Ctrl + Shift + ↑`: 右上4分の1
  - `Cmd + Ctrl + Shift + ↓`: 左下4分の1
  - `Cmd + Ctrl + Shift + →`: 右下4分の1

- **画面2分の1配置**
  - `Cmd + Ctrl + ←`: 左半分
  - `Cmd + Ctrl + →`: 右半分
  - `Cmd + Ctrl + ↑`: ウィンドウを最大化

- **画面3分の1幅配置**
  - `Ctrl + Option + →`: 右端に画面幅の3分の1で配置

#### マルチモニターサポート
- `Cmd + Ctrl + Option + →`: ウィンドウを次のモニターに移動

#### デスクトップスペースナビゲーション
- `Cmd + Option + Shift + ←`: 左のスペースに移動
- `Cmd + Option + Shift + →`: 右のスペースに移動

## インストール

プリセットはメインのセットアッププロセス中に、`/Applications/Setapp/BetterTouchTool.app`（Setapp経由）に BetterTouchTool が存在する場合のみ自動的にインポートされます。手動でインポートするには：

1. BetterTouchToolを開く
2. Presetsタブに移動
3. 「Import Preset」をクリック
4. `keyboardshortcuts.bttpreset`を選択

## カスタマイズ

ショートカットは以下の方法で変更できます：
1. BetterTouchToolを開く
2. インポートしたプリセットを選択
3. Keyboardタブで個々のショートカットを編集
4. 変更したプリセットをエクスポートして元のファイルを置き換え

## スナップエリア

プリセットには、ドラッグ&ドロップによるウィンドウ配置のための2つのスナップエリアも含まれています：
- **上部エリア**: ウィンドウを画面の上半分にスナップ
- **下部エリア**: ウィンドウを画面の下半分にスナップ

## タグ実行

プリセットのインポートだけ実行したい場合は、以下で実行できます：

- `ansible-playbook setup.yml --tags btt`

# macOS Setup Automation

私個人がmacOSの新規セットアップ時に使用するために作成したAnsibleプレイブックです。
同様のニーズを持つ方に役立つかもしれないと思い公開しています。

> [!NOTE]
> 不適切な内容や問題がございましたら、お気軽にお知らせください。

[English README](README.md)

## 概要

新しいmacOSマシンで必要なアプリケーションのインストールとDockの設定を自動化するAnsibleのプライブックです。
ymlファイルが1つだけで完結し、ansible-playbookコマンドを1回実行するだけで完了するようにしました。

> [!IMPORTANT]
> 私個人の環境に最適化されています。ご利用は自己責任でお願いします。実行前に必ず内容を確認し、必要に応じてカスタマイズしてください。

## クイックスタート

```bash
git clone https://github.com/sho-saito/macos-setup.git
cd macos-setup
./setup.sh
```

> [!IMPORTANT]
> 実行前に `setup.yml` の内容を確認し、不要なアプリケーションがある場合は事前に削除してください。

## 手動セットアップ

### 1. Homebrewのインストール

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Ansibleのインストール

```bash
brew install ansible
```

### 3. このリポジトリをクローン

```bash
git clone https://github.com/sho-saito/macos-setup.git
cd macos-setup
```

### 4. セットアップ実行

```bash
ansible-playbook setup.yml --ask-become-pass
```

> [!NOTE]
> `--ask-become-pass`フラグにより、管理者権限が必要なMac App Storeアプリをインストールする際に必要なパスワードの入力が求められます。

## インストールされるアプリケーション

### CLIツール

- **dockutil**, **mas** - Dock管理とMac App Store CLI

### アプリケーション

- **Microsoft Office** (Word, Excel, PowerPoint) + **Toggl Track** - Mac App Store経由
- **1Password**, **Kiro CLI**, **Claude Desktop** - Homebrew Cask経由
- **Vivaldi**, **Google Chrome**, **Firefox**, **Discord**, **ChatGPT**, **Notion**, **Notion Calendar**, **Docker**, **DeepL** - DMGダウンロード経由
- **Visual Studio Code**, **Setapp** - ZIPダウンロード経由

### 設定ファイル
- **BetterTouchTool** - ウィンドウ管理用キーボードショートカットプリセット

## インストール方法

必要に応じて異なるインストール方法でアプリのインストールをしています。

### 1. Homebrew（CLIツール）

必須のコマンドラインユーティリティ：

- dockutil、mas

### 2. Mac App Store

App Store経由でインストールするアプリケーション：

- Microsoft Officeソフト群、Toggl Track

### 3. Homebrew Cask（公式サポート確認済み）

Homebrewインストールを公式にサポートしているアプリケーション：

- 1Password、Kiro CLI、Claude Desktop

### 4. 公式.dmgダウンロード

公式Homebrewサポートがないアプリケーション：

- Vivaldi、Google Chrome、Firefox、Discord、ChatGPT、Notion、Notion Calendar、Docker、DeepL

### 5. その他のインストール方法

- Visual Studio Code（zipダウンロード）
- Setapp（インストーラーアプリ付きzipダウンロード）

## Dock設定

自動的に以下の順序でDockが設定されます。

1. Finder（自動）
2. Vivaldi
3. 1Password
4. Visual Studio Code
5. Claude Desktop
6. Notion
7. Notion Calendar
8. Toggl Track
9. Firefox
10. Applications（フォルダ）
11. Apps
12. System Settings

## BetterTouchTool設定

効率的なウィンドウ管理のためのキーボードショートカットプリセットを自動的にインポートします。詳細なショートカットと設定については [configs/bettertouchtool/README.md](configs/bettertouchtool/README.md) を参照してください。

## ファイル構成

```
macos-setup/
├── setup.sh                                    # 自動セットアップスクリプト
├── setup.yml                                   # Ansibleプレイブック（メイン）
├── configs/                                    # 設定ファイル
│   └── bettertouchtool/                        # BetterTouchToolプリセット
│       └── keyboardshortcuts.bttpreset         # ウィンドウ管理ショートカット
├── README.md                                   # 英語版README
├── README.ja.md                                # このファイル（日本語版）
└── .gitignore                                  # Git除外設定
```

## カスタマイズ

アプリの追加・削除やDock設定の変更は `setup.yml` を編集してください。

### アプリケーションの追加

新しいアプリケーションを追加する際は、以下の判断に沿って追加するようにしています。

**公式Homebrewサポートの確認**：
- 公式ドキュメントでHomebrewについて言及されているか確認
- 公式サポートがある場合のみHomebrewを使用
- 不明な場合は公式.dmgダウンロードを採用

---

**免責事項**: このプレイブックは私個人の使用目的で作成されており、すべての環境での動作を保証するものではありません。
使用により生じた問題について、作者は一切の責任を負いません。ご利用は自己責任でお願いします。

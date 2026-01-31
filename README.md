# macOS Setup Automation

A personal macOS setup automation that I created for my own use.
Sharing it in case it's useful for others who want a simple, single-file solution for setting up a new Mac.

> [!NOTE]
> If you find any inappropriate content or issues, please feel free to let me know.

[日本語版 README](README.ja.md)

## What This Does

This repository automates the installation of applications and Dock configuration for new macOS machines.
To keep things simple and avoid external dependencies, everything is contained in a single `setup.yml` file that uses officially documented installation methods.

> [!IMPORTANT]
> This playbook is optimized for my personal environment and workflow. Use at your own risk. Please review the contents before running and customize as needed.

## Quick Start

```bash
git clone https://github.com/sho-saito/macos-setup.git
cd macos-setup
./setup.sh
```

> [!IMPORTANT]
> Before running, please review the contents of `setup.yml` and remove any unnecessary applications.

## Manual Setup

### 1. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install Ansible

```bash
brew install ansible
```

### 3. Install Ansible collections

```bash
ansible-galaxy collection install --upgrade community.general
```

### 4. Clone this repository

```bash
git clone https://github.com/sho-saito/macos-setup.git
cd macos-setup
```

### 5. Run setup

```bash
ansible-playbook setup.yml --ask-become-pass
```

> [!NOTE]
> The `--ask-become-pass` flag will prompt you to enter your password for installing Mac App Store applications that require administrator privileges.

## What Gets Installed

### CLI Tools

- **copilot-cli**, **dockutil**, **mas**, **node**, **gh** - GitHub Copilot CLI, Dock management, Mac App Store CLI, Node.js, and GitHub CLI

### Applications

- **Microsoft Office** (Word, Excel, PowerPoint) + **Toggl Track** + **Slack** - via Mac App Store
- **1Password**, **Kiro CLI**, **Claude Desktop** - via Homebrew Cask
- **Vivaldi**, **Google Chrome**, **Firefox**, **Discord**, **ChatGPT**, **Notion**, **Notion Calendar**, **Docker**, **DeepL** - via DMG download
- **Visual Studio Code**, **Setapp** - via ZIP download

### Configuration Files

> [!NOTE]
> The preset is imported only when BetterTouchTool is detected at `/Applications/Setapp/BetterTouchTool.app` (Setapp install). The playbook does not install BetterTouchTool itself.

- **BetterTouchTool** - Keyboard shortcuts preset for window management

## Installation Methods

Different installation methods are used as needed:

### 1. Homebrew (CLI Tools)

Essential command-line utilities:

- copilot-cli, dockutil, mas, node, gh

### 2. Mac App Store

Applications installed through the App Store:

- Microsoft Office suite, Toggl Track, Slack

### 3. Homebrew Cask (Official Support Confirmed)

Applications that officially support Homebrew installation:

- 1Password, Kiro CLI, Claude Desktop

### 4. Official .dmg Downloads

Applications without official Homebrew support:

- Vivaldi, Google Chrome, Firefox, Discord, ChatGPT, Notion, Notion Calendar, Docker, DeepL

### 5. Other Installation Methods

- Visual Studio Code (zip download)
- Setapp (zip download with installer app)

## Dock Configuration

Automatically configures the Dock in this order:

1. Finder (automatic)
2. Vivaldi
3. 1Password
4. Visual Studio Code
5. Claude Desktop
6. Notion
7. Notion Calendar
8. Toggl Track
9. Slack
10. Firefox
11. Applications (folder)
12. Apps
13. System Settings

## BetterTouchTool Configuration

Automatically imports a keyboard shortcuts preset for efficient window management **only when BetterTouchTool is already installed**. See [configs/bettertouchtool/README.md](configs/bettertouchtool/README.md) for detailed shortcuts and configuration.

## File Structure

```
macos-setup/
├── .github/workflows/ci.yml                    # GitHub Actions CI workflow
├── setup.sh                                    # Automated setup script
├── setup.yml                                   # Ansible playbook (main)
├── configs/                                    # Configuration files
│   └── bettertouchtool/                        # BetterTouchTool presets
│       ├── keyboardshortcuts.bttpreset         # Window management shortcuts
│       ├── README.md                           # BetterTouchTool config details (English)
│       └── README.ja.md                        # BetterTouchTool config details (Japanese)
├── README.md                                   # This file (English)
├── README.ja.md                                # Japanese README
└── .gitignore                                  # Git exclusion settings
```

## Tags

- `ci_test`: Installs CI-safe dependencies and apps (used by GitHub Actions).
- `btt`: Runs BetterTouchTool preset import steps only.

## Customization

To add/remove apps or change Dock settings, edit `setup.yml`.

### Adding Applications

When adding new applications, follow this decision process:

**Check Official Homebrew Support**:
- Look for official documentation mentioning Homebrew
- Only use Homebrew if officially supported
- When in doubt, use official .dmg download

---

**Disclaimer**: This playbook was created for my personal use and is not guaranteed to work in all environments.
The author assumes no responsibility for any issues that may arise from its use. Use at your own risk.

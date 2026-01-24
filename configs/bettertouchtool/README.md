# BetterTouchTool Configuration

This directory contains BetterTouchTool presets for efficient window management and productivity.

## Files

### keyboardshortcuts.bttpreset

A comprehensive keyboard shortcuts preset named "Window Management Shortcuts" that provides:

#### Window Management
- **Quarter Screen Positioning**
  - `Cmd + Ctrl + Shift + ←`: Left top quarter
  - `Cmd + Ctrl + Shift + ↑`: Right top quarter  
  - `Cmd + Ctrl + Shift + ↓`: Left bottom quarter
  - `Cmd + Ctrl + Shift + →`: Right bottom quarter

- **Half Screen Positioning**
  - `Cmd + Ctrl + ←`: Left half
  - `Cmd + Ctrl + →`: Right half
  - `Cmd + Ctrl + ↑`: Maximize window

- **One-Third Width Positioning**
  - `Ctrl + Option + →`: Position to right third of screen

#### Multi-Monitor Support
- `Cmd + Ctrl + Option + →`: Move window to next monitor

#### Desktop Space Navigation
- `Cmd + Option + Shift + ←`: Move to left space
- `Cmd + Option + Shift + →`: Move to right space

## Installation

The preset is automatically imported during the main setup process **only when** BetterTouchTool is installed at `/Applications/Setapp/BetterTouchTool.app` (Setapp install). To manually import:

1. Open BetterTouchTool
2. Go to Presets tab
3. Click "Import Preset"
4. Select `keyboardshortcuts.bttpreset`

## Customization

You can modify the shortcuts by:
1. Opening BetterTouchTool
2. Selecting the imported preset
3. Editing individual shortcuts in the Keyboard tab
4. Exporting the modified preset to replace the original file

## Snap Areas

The preset also includes two snap areas for drag-and-drop window positioning:
- **Top area**: Snaps windows to upper half of screen
- **Bottom area**: Snaps windows to lower half of screen

## Tagged Run

If you only want to import the preset, run the playbook with:

- `ansible-playbook setup.yml --tags btt`

#!/bin/bash

set -e

echo "🚀 macOS Setup Script Starting..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "📦 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "✅ Homebrew already installed"
fi

# Install Ansible
if ! command -v ansible &> /dev/null; then
    echo "🔧 Installing Ansible..."
    brew install ansible
else
    echo "✅ Ansible already installed"
fi

# Install Ansible collections
echo "📚 Installing Ansible collections..."
ansible-galaxy collection install --upgrade community.general

# Run the playbook
echo "🎯 Running macOS setup playbook..."
ansible-playbook setup.yml --ask-become-pass -vv

echo "🎉 macOS setup completed!"
echo "💡 You may need to restart some applications or log out/in for all changes to take effect."

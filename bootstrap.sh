#!/bin/bash

# Navigate to dotfiles directory
cd "$(dirname "$0")"

# Apply packages
echo "Stowing configurations..."
stow agents
stow git

echo "Dotfiles successfully stowed!"

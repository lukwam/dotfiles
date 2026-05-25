#!/bin/bash

# Navigate to dotfiles directory
cd "$(dirname "$0")"

# Apply packages targeting home directory
echo "Stowing configurations to $HOME..."
stow -t "$HOME" agents
stow -t "$HOME" git

echo "Dotfiles successfully stowed!"

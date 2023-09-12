#!/bin/bash
# Set up for the env
# Author: Tran Dinh Dong
# Date: 12/09/2023

while true; do
    read -p 'Syncing Codium Configuration Option:
    1. Bash
    2. Zsh
    --Choose 1 or 2:  ' option
    case $option in
    [1])
        echo "REPO_DIR=$(pwd)" >>$HOME/.bashrc
        echo "CODIUM_CONFIG=$HOME/.config/VSCodium/User/" >>$HOME/.bashrc
        source "$HOME"/.bashrc
        break
        ;;
    [2])
        echo "REPO_DIR=$(pwd)" >>$HOME/.zshrc
        echo "CODIUM_CONFIG=$HOME/.config/VSCodium/User/" >>$HOME/.zshrc
        source $HOME/.zshrc
        break
        ;;
    esac
done

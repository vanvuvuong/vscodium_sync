#!/bin/bash
# Merge the codium setting, keybindings and profile configuration
# Author: Tran Dinh Dong
# Date: 12/09/2023
while true; do
    if [ "${REPO_DIR}" = '' ] && [ "${CODIUM_CONFIG}" = '' ]; then
        read -rp "Look like you haven't setup the environment param.
        Do you want me to set them up? [Y/n]:" param
        case $param in
        [Yy]*)
            echo "$(ls)"
            source scripts/env.sh
            ;;
        *)
            echo "WARNING: The script will be failed if environment params haven't setup."
            ;;
        esac
    fi
    read -rp 'Syncing Codium Configuration Option:
    1.From LOCAL to REPOSITORY
    2.From REPOSITORY to LOCAL
    3.Install Extension from extension scripts.
    4.Export Extension to scripts
    --Choose 1, 2, 3 or 4: ' option
    case $option in
    [1])
        while true; do
            read -rp "Confirm [Y/n]:" yn
            case $yn in
            [Yy]*)
                cp -vur "${CODIUM_CONFIG}/snippets/"* "${REPO_DIR}/User/snippets/"
                cp -u "${CODIUM_CONFIG}/keybindings.json" "${REPO_DIR}/User/keybindings.json"
                cp -u "${CODIUM_CONFIG}/settings.json" "${REPO_DIR}/User/settings.json"
                echo "##### DONE"
                git add .
                git commit -m "sync user setting data"
                break
                ;;

            [Nn]*) exit ;;
            esac
        done
        break
        ;;
    [2])
        while true; do
            read -rp "Confirm [Y/n]:" yn
            case $yn in
            [Yy]*)
                cp -vur "${REPO_DIR}/User/"* "${CODIUM_CONFIG}"
                break
                ;;
            [Nn]*) exit ;;
            esac
        done
        break
        ;;
    [3])
        echo "Install Extension to Codium"
        exec "${REPO_DIR}/scripts/extension.sh"
        break
        ;;
    [4])
        echo "Export Codium Extensions installation script"
        codium --list-extensions | xargs -L 1 echo codium --install-extension |& tee "${REPO_DIR}/scripts/extension.sh"
        git add .
        git commit -m "sync user setting data"
        break
        ;;
    esac
done

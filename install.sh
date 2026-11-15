#!/bin/bash

DOTFILES="$HOME/projects/dotfiles"

link_file() {
    local source="$1"
    local target="$2"

    mkdir -p "$(dirname "$target")"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
        mv "$target" "$target.backup"
    fi

    ln -sfn "$source" "$target"

    echo "Linked: $target"
}

link_file "$DOTFILES/ghostty/config" \
    "$HOME/.config/ghostty/config"

link_file "$DOTFILES/zsh/.zshrc" \
    "$HOME/.zshrc"

if [ -f "$DOTFILES/zsh/.p10k.zsh" ]; then
    link_file "$DOTFILES/zsh/.p10k.zsh" \
        "$HOME/.p10k.zsh"
fi

echo "Dotfiles installed!"

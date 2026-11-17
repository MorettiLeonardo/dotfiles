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

link_file "$DOTFILES/ghostty/themes" \
    "$HOME/.config/ghostty/themes"

link_file "$DOTFILES/zsh/.zshrc" \
    "$HOME/.zshrc"


echo "Dotfiles installed!"

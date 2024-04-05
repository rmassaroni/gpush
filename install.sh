#!/bin/bash

if [ -f "$HOME/gpush.sh" ]; then
    echo "gpush.sh already exists in the home directory."
    exit 1
fi

curl -sSL -o "$HOME/gpush" https://github.com/rmassaroni/gpush/gpush
echo "export PATH=\"\$HOME:\$PATH\"" >> "$HOME/.zshrc"
source "$HOME/.zshrc"

echo "gpush has been installed to $HOME directory and added to the PATH."

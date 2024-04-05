#!/bin/bash

if [ -f "$HOME/gpush.sh" ]; then
    echo "gpush.sh already exists in the home directory."
    exit 1
fi

curl -sSL -o "$HOME/gpush.sh" https://github.com/rmassaroni/gpush/gpush
chmod +x $HOME/gpush.sh
echo "export PATH=\"\$HOME:\$PATH\"" >> "$HOME/.zshrc"
source "$HOME/.zshrc"

echo "gpush has been installed to $HOME directory and added to the PATH."

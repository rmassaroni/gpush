#!/bin/bash

if [ -f "$HOME/.gpush/gpush" ]; then
    echo "gpush.sh already exists in the home directory."
    exit 1
fi

#curl -sSL -o "$HOME/gpush.sh" https://github.com/rmassaroni/gpush/gpush
mkdir -p $HOME/.gpush
git clone https://github.com/rmassaroni/gpush $HOME/.gpush
chmod +x $HOME/.gpush/gpush
echo "export PATH=\"\$HOME/.gpush:\$PATH\"" >> "$HOME/.zshrc"
source "$HOME/.zshrc"

echo "gpush has been installed to $HOME directory and added to the PATH."

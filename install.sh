#!/bin/bash

if [ -f "$HOME/.gpush/gpush.sh" ]; then
    echo "gpush.sh already exists in the home directory."
    echo "checking for updates..."

    #chmod +x ./update.sh
    #source "./update.sh"

    rm -rf ~/.gpush #temporary
fi


#else
    #curl -sSL -o "$HOME/gpush.sh" https://github.com/rmassaroni/gpush/gpush
    mkdir -p $HOME/.gpush
    git clone https://github.com/rmassaroni/gpush $HOME/.gpush
    rm -rf ~/.gpush/.git
    chmod +x $HOME/.gpush/gpush.sh
    echo "export PATH=\"\$HOME/.gpush:\$PATH\"" >> "$HOME/.zshrc"
    source "$HOME/.zshrc"

    echo "gpush has been installed to $HOME directory and added to the PATH."
#fi

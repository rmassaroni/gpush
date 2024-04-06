#!/bin/zsh

#source ./gcopy.sh

glink() {
    is_quiet() {
        [[ "$1" = -q ]]
    }
    quiet=false
    if is_quiet "$1"; then
        quiet=true 
        shift
    fi
    echo "$quiet"


    if [ -d ".glinks" ]; then
        echo "Directory 'glinks' found in current directory."
        gcopy ".glinks"
    else
        if [ "$quiet" = false ]; then
            echo "Directory '.glinks' not found."
        fi
        return 1
    fi
}


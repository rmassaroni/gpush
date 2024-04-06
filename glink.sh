#!/bin/bash

#source ./gcopy.sh

glink() {
    is_quiet() {
        [[ "$1" = -q ]]
    }

    if [ -d ".glinks" ]; then
        echo "Directory 'glinks' found in current directory."
        gcopy ".glinks"
    else
        if is_quiet "$1"; then
            echo "Directory '.glinks' not found."
        fi
        return 1
    fi
}


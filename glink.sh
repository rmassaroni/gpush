#!/bin/bash

#source ./gcopy.sh

glink() {
    if [ -d ".glinks" ]; then
        echo "Directory 'glinks' found in current directory."
        gcopy "glinks"
    else
        echo "Directory 'glinks' not found."
        return 1
    fi
}


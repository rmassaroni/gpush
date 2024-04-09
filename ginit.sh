#!/bin/zsh


ginit() {
    if [ -d ".git" ]; then
        echo "Error: already a git repo"
        return 1
    fi

    if [ -z "$1" ]; then
        echo "Please provide a username as an argument."
        return 1
    fi
    username=$1

    current_directory=$(basename "$(pwd)")

    git init
    touch README.md
    git branch -M main
    git remote add origin https://github.com/$username/$current_directory.git
    git add .
    git commit -m "first commit"
    git push -u origin main
}

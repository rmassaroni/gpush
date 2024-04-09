#!/bin/zsh


ginit() {

    current_directory=$(basename "$(pwd)")

    git init
    touch README.md
    git branch -M main
    git remote add origin https://github.com/user/$current_directory.git
    git add .
    git commit -m "first commit"
    git push -u origin main
}

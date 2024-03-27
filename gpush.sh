#!/bin/bash

#source ./gconfig.sh

gpush() {
    current_dir=$(pwd)

    while [ ! -d "$current_dir/.git" ] && [ "$current_dir" != "/" ]; do
        current_dir=$(dirname "$current_dir")
    done

    if [ -d "$current_dir/.git" ]; then
        message="${1:-unnamed commit}"
        branch="${2:-main}"

        echo "Git repo found: $current_dir"

        if [ "$auto_glink" = "true" ]; then
            echo "auto-glinking..."
            glink
        fi

        echo "pushing '$message' to '$branch'..."
        git -C "$current_dir" add --all && git -C "$current_dir" commit -m "$message" && git -C "$current_dir" push -u origin "$branch"
    else
        echo "ERROR: Not a Git repository."
        return 1;
    fi
}





#!/bin/bash

#source ./gconfig.sh

gpush() {
    if [ -d .git ]; then
        message="${1:-unnamed commit}"

        echo "Git repo found."

        if [ "$auto_glink" = "true" ]; then
            echo "auto-glinking..."
            glink
        fi

        echo "pushing '$message' to main..."
        git add --all && git commit -m "$message" && git push -u origin main
    else
        echo "ERROR: Not a Git repository."
        return 1;
    fi
}





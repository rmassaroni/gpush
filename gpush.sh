#!/bin/zsh

#source ./gconfig.sh


gpush() {
    is_quiet() {
        [[ "$1" = "-q" ]]
    }
    echo "$1"
    current_dir=$(pwd)

    if is_quiet "$1"; then
        shift
    fi
    echo "$1"

    while [ ! -d "$current_dir/.git" ] && [ "$current_dir" != "/" ]; do
        current_dir=$(dirname "$current_dir")
    done

    if [ -d "$current_dir/.git" ]; then
        message="${1:-unnamed commit}"
        branch="${2:-main}"

        if is_quiet "$1"; then
            exec 1>/dev/null
            exec 2>/dev/null
        else
            echo "Git repo found: $current_dir"
        fi

        if [ "$auto_glink" = "true" ]; then
            if is_quiet "$1"; then
                #glink -q #need to first make glink -q
                glink
            else
                echo "auto-glinking..."
                glink
            fi
        fi

        if is_quiet "$1"; then
            git -C "$current_dir" add --all && git -C "$current_dir" commit -m "$message" && git -C "$current_dir" push -u origin "$branch" >/dev/null 2>&1
        else
            echo "pushing '$message' to '$branch'..."
            git -C "$current_dir" add --all && git -C "$current_dir" commit -m "$message" && git -C "$current_dir" push -u origin "$branch"
        fi
    else
        echo "ERROR: Not a Git repository."
        return 1;
    fi
}




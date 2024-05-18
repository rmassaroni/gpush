#!/bin/zsh

gpush() {
    echo "test"
    echo "auto_glink"




    is_quiet() {
        [[ "$1" = "-q" ]]
    }
    quiet=false
    current_dir=$(pwd)

    if is_quiet "$1"; then
        quiet=true
        shift
    fi

    quiet=false
    while [ ! -d "$current_dir/.git" ] && [ "$current_dir" != "/" ]; do
        current_dir=$(dirname "$current_dir")
    done

    if [ -d "$current_dir/.git" ]; then
        message="${1:-unnamed commit}"
        branch="${2:-main}"

        #if is_quiet "$1"; then
        if [ "$quiet" = false ]; then
            echo "Git repo found: $current_dir"
        fi

        if [ "$auto_glink" = "true" ]; then
            #if is_quiet "$1"; then
            if [ "$quiet" = true ]; then
                #glink -q #need to first make glink -q
                glink -q
            else
                echo "auto-glinking..."
                glink
            fi
        fi

        #if is_quiet "$1"; then
        if [ "$quiet" = true ]; then
            git -C "$current_dir" add --all && git -C "$current_dir" commit -q -m "$message" && git -C "$current_dir" push -u -q origin "$branch"
        else
            echo "pushing '$message' to '$branch'..."
            git -C "$current_dir" add --all && git -C "$current_dir" commit -m "$message" && git -C "$current_dir" push -u origin "$branch"
        fi
        echo "pushed '$message' to '$branch'"
    else
        echo "ERROR: Not a Git repository."
        return 1;
    fi
}


echo "$auto_glink"
echo "$default_branch"

gpush() {
    if [ -d .git ]; then
        message="${1:-unnamed commit}"
        echo "pushing '$message' to main"
        git add --all && git commit -m "$message" && git push -u origin main
    else
        echo "ERROR: Not a Git repository."
    fi
}

glink() {
    if [[ ! -d .git ]]; then
        echo "Not a Git repository"
        return 1
    fi

    links=$(find . -type l)
    if [[ -z $links ]]; then
        echo "No links found"
        return
    fi
    
    while IFS= read -r symlink; do
        target=$(readlink -f "$symlink")
        echo "Symbolic link: $symlink -> $target"
        git add "$symlink"
        git commit -m "Add symbolic link: $symlink -> $target"
    done <<< "$links"

}

gcopy() {
    local source="$1"
    local destination="${2:-./$(basename "$source")}"

    if [ -z "$source" ]; then
        echo "ERROR: Missing source parameter"
        return 1
    fi

    echo "Copying $source to $destination"
    cat $source > $destination
}

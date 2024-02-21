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
        #target=$(readlink "$symlink")
        #if [[ $target != /* ]]; then
        #    echo $target
        #fi
        target=$(readlink -f "$symlink")
        echo "Symbolic link: $symlink -> $target"
    done <<< "$links"

}

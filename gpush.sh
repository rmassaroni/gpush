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
    if [[ -z $links ]]; then
        echo "No links found"
        return
    fi

}

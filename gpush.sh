gpush() {
    if [ -d .git ]; then
        message="{1:-'unnamed commit'}"
        git add --all && git commit -m "$message" && git push -u origin main
    else
        echo "ERROR: Not a Git repository."
    fi
}

gpush() {
    if [ -d .git ]; then
        message="${1:-unnamed commit}"
        echo "pushing '$message' to main"
        git add --all && git commit -m "$message" && git push -u origin main
    else
        echo "ERROR: Not a Git repository."
        return 1;
    fi
}

glink() {
    if [ -d "glinks" ]; then
        echo "Directory 'glinks' found in current directory."
    else
        echo "Directory 'glinks' not found."
        return 1
    fi
}

gcopy() {
    local source="$1"
    local destination="${2:-./$(basename "$source")}"

    if [ -z "$source" ]; then
        echo "ERROR: Missing source parameter"
        return 1
    fi

    if [ -f "source" ]; then
        echo "Copying file $source to $destination"
        cat "$source" > "$destination"
    elif [ -d "$source" ]; then
        echo "Copying files from directory $source to $destination"
        cat "$source"/* > "$destination"
    else
        echo "ERROR: Source '$source' not found"
        return 1
    fi
}

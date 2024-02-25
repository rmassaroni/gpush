#!/bin/bash

source ./gconfig.sh

gpush() {
    if [ -d .git ]; then
        message="${1:-unnamed commit}"

        echo "Git repo found."

        echo "$auto_glink"
        if ["$auto_glink" ="true" ]; then
            echo "auto-glinking"
            glink
        fi

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
        gcopy "glinks"
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

    if [ -f "$source" ]; then
        echo "Copying file $source to $destination"
        cat "$source" > "$destination"
    elif [ -h "$source" ]; then
        echo "Copying link $source to $destination"
        cat "$source" > "$destination"
    elif [ -d "$source" ]; then
        echo "Copying files from directory $source to $destination"
        for file in "$source"/* "$source"/.[!.]*; do
            #gcopy "$file" "../$(basename "$file")"
            #[ -e "$file" ] && [ "$file" != "$source"/* ] && [ "$file" != "$source"/. ] && gcopy "$file" "$destination/$(basename "$file")"
            if [ -e "$file" ] && [ "$file" != "$source/*" ] && [ "$file" != "$source/." ]; then
                gcopy "$file" "./$(basename "$file")"
            fi
        done
    else
        echo "ERROR: Source '$source' not found"
        return 1
    fi
}


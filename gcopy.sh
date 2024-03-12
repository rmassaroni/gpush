#!/bin/bash

#source ./gconfig.sh

gcopy() {
    local source="$1"
    local destination="${2:-./$(basename "$source")}"

    if [ -z "$source" ]; then
        echo "ERROR: Missing source parameter"
        return 1
    fi

    if [ -f "$source" ] || [ -h "$source" ]; then
        if [ -h "$source" ]; then
            echo "Copying link $source to $destination"
        else
            echo "Copying file $source to $destination"
        fi
        
        if [ "$unhide" = "true" ]; then
            local basename=$(basename "$destination")
            if [[ $basename == .* ]]; then
                echo "unhiding..."
                basename="${basename:1}"
                echo "new destination: $basename"
            fi
        fi
        
        cat "$source" > "./$basename"
    elif [ -d "$source" ]; then
        echo "Copying files from directory $source to $destination"
        for file in "$source"/* "$source"/.[!.]*; do
            if [ -e "$file" ] && [ "$file" != "$source/*" ] && [ "$file" != "$source/." ]; then
                gcopy "$file" "./$(basename "$file")"
            fi
        done
    else
        echo "ERROR: Source '$source' not found"
        return 1
    fi
}

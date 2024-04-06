#!/bin/bash

# Specify the path to the gpush.sh script
gpush_path="$HOME/.gpush/gpush.sh"

#git -C "$HOME/.gpush" clean -df
# Pull the latest changes from the git repository
#git -C "$HOME/.gpush" pull --force origin main

# Pull the latest changes from the git repository, forcing the pull
git -C "$HOME/.gpush" fetch --all
git -C "$HOME/.gpush" reset --hard origin/main

# Clean untracked files in the repository
git -C "$HOME/.gpush" clean -df


# Make sure the gpush.sh script is executable
chmod +x "$gpush_path"

echo "gpush has been updated."


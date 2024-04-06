#!/bin/bash

# Specify the path to the gpush.sh script
gpush_path="$HOME/.gpush/gpush.sh"

# Pull the latest changes from the git repository
git -C "$HOME/.gpush" pull --force --clean origin main

# Make sure the gpush.sh script is executable
chmod +x "$gpush_path"

echo "gpush has been updated."


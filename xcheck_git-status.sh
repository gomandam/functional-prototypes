#!/bin/bash

# Array of folder names
repos=($(ls -d */))

#Introduction
echo
echo "Function: the script checks the git-status of all repositories in the current directory."
echo 

# New Implementation: checks the current directory if it is a parent directory, or a git repository directory too.
# If parent, it will give an error "fatal: not a git repository (or any parent up to mount point /)  Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set)."
# silence this error, and print a short notification. Maybe "The current directory is a folder." or something more appropriate.
# then proceed checking recursively each sub-directories. Do not change the syntax and logic of the script.

# Loop through each repository
for repo in "${repos[@]}"; do
    echo "CHECK STATUS: '${repo%/}' ..."  # Remove trailing slash for cleaner output
    cd "$repo" || {
        echo "Failed to enter directory '$repo'"
        continue
    }

    # Get the status output
    status=$(git status --porcelain)

    # Check if there are changes
    if [ -n "$status" ]; then
        echo "Repository '${repo%/}' has uncommitted changes:"
        echo "$status"
        
        # Notify (simple terminal notification)
        notify-send "Git Notification" "'${repo%/}' has uncommitted changes or untracked files."
    else
        echo "Repository '${repo%/}' is clean."
    fi
    
    # Print a newline for separation
    echo  # This adds a new line

    # Go back to the parent directory
    cd .. || exit
done

printf 'Authored by: \e]8;;https://github.com/gomandam\e\\🅶🅾🅼🅰🅽🅳🅰🅼\e]8;;\e\\\n'
echo

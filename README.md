gpush allows one to add, commit, and push with one command.

Precedure:
The gpush() -message -branch function searches for a Git repo and return an error if it fails to find one.
If found, it adds all changes, commits with a chosen message, and pushes to a chosen branch.
The default message is "unnamed commit" but can be changed.
The default branch is "main" but can also be changed.

TODO:
Option to make the default branch the currently checked out branch.
glink() and gcopy() search for a dotfiles directory.
Make files executable instead of using functions.
Clean up README.


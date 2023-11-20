#!/bin/bash

# This script adds all hooks to a given directory
# Usage: add_hook_to_directory.sh <directory>

# Check if directory is given
if [ $# -eq 0 ]
  then
    echo "No directory supplied"
    exit 1
fi

# Check if directory exists
if [ ! -d "$1" ]
  then
    echo "Directory does not exist"
    exit 1
fi

# Check if directory is a git repository
if [ ! -d "$1/.git" ]
  then
    echo "Directory is not a git repository"
    exit 1
fi

# Get absolute path of directory
cd $1
DIRECTORY=$(pwd)
cd - > /dev/null

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# link the hooks
ln -f -s $SCRIPT_DIR/hooks/pre-commit $DIRECTORY/.git/hooks/pre-commit
ln -f -s $SCRIPT_DIR/hooks/pre-push $DIRECTORY/.git/hooks/pre-push
# ln -f -s $SCRIPT_DIR/hooks/post-checkout $DIRECTORY/.git/hooks/post-checkout

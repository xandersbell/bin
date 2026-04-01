#!/bin/bash

# Check and install gum (Charmbracelet TUI tool)
if ! command -v gum &> /dev/null; then
    echo "gum is not installed. Attempting to install via Homebrew..."

    # Check if Homebrew exists
    if ! command -v brew &> /dev/null; then
        echo "Error: Homebrew is not installed. Please install Homebrew first: https://brew.sh/"
        exit 1
    fi

    # Execute installation
    brew install gum
    
    if [ $? -eq 0 ]; then
        echo "gum installed successfully."
    else
        echo "Error: Failed to install gum."
        exit 1
    fi
else
    echo "gum is already installed at $(which gum)."
fi

# Example: Use gum to confirm setup completion
gum style --foreground 212 --border-foreground 212 --border double --align center --width 40 "Setup environment is ready!"

#!/bin/bash

# 1. Check and install gum (Charmbracelet TUI tool)
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
fi

# 2. Identity & Directory Detection
# We use BASH_SOURCE to find where this script lives
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# We prefer the actual user even if the script is run with sudo
ACTUAL_USER="${SUDO_USER:-$(whoami)}"
TARGET_FILE="/etc/paths.d/${ACTUAL_USER}-bin"

# Banner
gum style \
    --foreground "#00D7D7" \
    --border rounded \
    --border-foreground "#00D7D7" \
    --padding "1 2" \
    --align center \
    --width 68 \
    --margin "1 0" \
    "📍 System Bin Initialization" \
    "Script Source: $SCRIPT_DIR" \
    "Target User: $ACTUAL_USER"

# 3. Check Existing Configuration
if [ -f "$TARGET_FILE" ]; then
    gum style --foreground "#AF87FF" --bold --width 68 --align center "Current PATH Configuration ($TARGET_FILE):"
    gum style --foreground "#7A5FFF" --border rounded --padding "0 2" --width 68 "$(cat "$TARGET_FILE")"
    echo ""
fi

# 4. Scanning Subdirectories
# We ignore hidden directories (starting with .)
SUBDIRS=()
while IFS='' read -r line; do SUBDIRS+=("$line"); done < <(find "$SCRIPT_DIR" -maxdepth 1 -type d -not -path "$SCRIPT_DIR" -not -path '*/.*' -not -path '*/_*' -exec basename {} \;)

if [ ${#SUBDIRS[@]} -eq 0 ]; then
    gum style --foreground "#EAB308" "⚠️  No valid subdirectories found in $SCRIPT_DIR."
    exit 0
fi

# 4. Interactive Selection
echo "$(gum style --foreground "#AF87FF" "Pick subdirectories to add to your system PATH (Space to toggle, Enter to confirm):")"
SELECTED=$(printf "%s\n" "${SUBDIRS[@]}" | gum choose --no-limit)

if [ -z "$SELECTED" ]; then
    gum style --foreground "#FF4B4B" "❌ No options selected. Operation cancelled."
    exit 0
fi

# 5. Preparing Path File Content
# Each selected directory will be converted to an absolute path
PATH_CONTENT=""
for dir in $SELECTED; do
    PATH_CONTENT="${PATH_CONTENT}${SCRIPT_DIR}/${dir}\n"
done

# 6. Secure write to /etc/paths.d/

gum style --foreground "#00D7D7" --bold "Attempting to write to $TARGET_FILE..."
gum style --foreground "#7A5FFF" "Note: You might be prompted for your sudo password."

# Use printf and sudo tee to handle newlines correctly and write to protected location
printf "$PATH_CONTENT" | sudo tee "$TARGET_FILE" > /dev/null

# 7. Ensure all scripts are executable (Recursive)
gum style --foreground "#AF87FF" "Ensuring all scripts in $SCRIPT_DIR are executable..."
find "$SCRIPT_DIR" -maxdepth 2 -type f -not -name "README.md" -not -path '*/.*' -exec chmod +x {} +

# 8. Git Hook Installation (Self-referencing)
# Ensure the custom githooks directory is active and the hook itself is executable
if [ -d ".githooks" ]; then
    gum style --foreground "#AF87FF" "Configuring custom Git hooks path (.githooks)..."
    chmod +x .githooks/pre-commit
    git config core.hooksPath .githooks
fi

if [ $? -eq 0 ]; then
    gum style \
        --foreground "#00FF7F" \
        --border rounded \
        --border-foreground "#00FF7F" \
        --padding "1 2" \
        --align center \
        --width 68 \
        --margin "1 0" \
        "✅ CONFIGURATION SUCCESSFUL" \
        "Created: $TARGET_FILE" \
        "Git Hooks: Active" \
        "" \
        "Please RESTART your terminal session" \
        "or run: source /etc/profile"
else
    gum style --foreground "#FF4B4B" --bold "❌ Failed to write configuration. Please check your permissions."
fi

# MacOS Personal Bin Tools

A curated collection of shell utilities enhanced with `gum` for a premium TUI experience on MacOS.

## 🚀 Pinchtab Toolchain

Modern interactive browser automation bridge for AI agents.

### Core Utilities
- **`pinchtab/pinchtab-launch [profile]`**: 
  Launches a managed browser instance. Supports auto-creation of profiles and automatic port mapping for `general`, `ask`, and `youtube`.
- **`pinchtab/pinchtab-cleanup`**: 
  Interactive TUI utility to safely terminate running instances (supports multi-select or global kill).

### Service Shorthands
Directly control specific instances using environment-aware redirects:
- **`pinchtab/pinchtab-general`**: Controls the `general` instance (Port 19950).
- **`pinchtab/pinchtab-ask`**: Controls the `ask` instance (Port 19951).
- **`pinchtab/pinchtab-youtube`**: Controls the `youtube` instance (Port 19952).

---

## 🛠 Developer Utilities

- **`echotest`**: Premium TUI argument visualizer using `gum` styling.
- **`setup.sh`**: Automated dependency installer (Homebrew, Gum).

## 📋 Requirements
- [Homebrew](https://brew.sh/)
- [gum](https://github.com/charmbracelet/gum)
- [jq](https://stedolan.github.io/jq/)

---
*Maintained under the AGENTS.md Constitution.*
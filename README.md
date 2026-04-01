# 🚀 MacOS Personal Bin Ecosystem

A premium, one-stop management repository for personal shell utilities on MacOS, meticulously designed for AI agents and human developers.

## 🌟 Mission
To provide a standardized, interactive, and high-performance environment for personal scripts, leveraging modern TUI tools and system-level integrations.

---

## 🏁 Quick Start: Initialization

Before using any of the tools, you **must** run the setup script to initialize the environment:

```bash
bash setup.sh
```

**What `setup.sh` does:**
1.  **Dependency Check:** Installs `homebrew` and `gum` if missing.
2.  **Interactive Configuration:** Detects current tool subdirectories.
3.  **Path Management:** Interactive multi-select TUI to inject chosen directories into `/etc/paths.d/` for global terminal access.

---

## 🦊 PinchTab Toolchain Design

The repository features a robust, environment-aware suite for [PinchTab](https://pinchtab.com) management.

### 1. Launch & Provisioning (`pinchtab/pinchtab-launch`)
The "smart switch" for your browser instances. 
- **Auto-Provisioning:** Automatically creates and initializes profiles via the PinchTab API if they don't exist.
- **Conflict Prevention:** Pre-checks ports before launching to prevent 409 errors.
- **UI Context:** Dynamic coloring (Cyan for General, Purple for Ask, Red for YouTube).

### 2. Service Shorthands & Profile Designs
Directly control specific instances using environment-aware redirects. Each profile is optimized for specific workloads:
- **`pinchtab/pinchtab-general`** (Port 19950):
  General-purpose browsing and administrative tasks.
- **`pinchtab/pinchtab-ask`** (Port 19951):
  Dedicated environment for AI-powered asking/answering tools including **ChatGPT**, **Anthropic**, **Gemini**, and **Perplexity**.
- **`pinchtab/pinchtab-youtube`** (Port 19952):
  Optimized for **YouTube** automation, leveraging logged-in Google accounts specifically for **YouTube Premium** features.

### 3. Cleanup & Management (`pinchtab/pinchtab-cleanup`)
An interactive dashboard to manage active sessions:
- List all active instances with IDs and Port numbers.
- **Selective Kill:** Choose specific instances to terminology.
- **Global Reset:** Stop all active PinchTab sessions in one click.

---

## 🛠 Developer & Debugging Tools
(Future utilities will be documented here.)

## 📋 Requirements
- [Homebrew](https://brew.sh/)
- [gum](https://github.com/charmbracelet/gum) (Managed by `setup.sh`)
- [jq](https://stedolan.github.io/jq/)

---
> [!NOTE]
> All scripts follow the **AGENTS.md** constitution, ensuring English-only UI, documentation, and logic comments for maximum cross-compatibility and agent legibility.
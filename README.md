# 🚀 MacOS Personal Shortcuts Ecosystem

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
1. **Dependency Check:** Installs `homebrew` and `gum` if missing.
2. **Interactive Configuration:** Detects current tool subdirectories (excluding `_` prefixed private scripts).
3. **Path Management:** Interactive multi-select TUI to inject chosen directories into `/etc/paths.d/` for global terminal access.
4. **Git Hooks:** Configures custom `.githooks` for commit validation.

### Environment Variable Setup

Some scripts rely on `BELL_BIN_PATH` pointing to the project root. Add to your shell profile (`.zshrc`, `.bashrc`, etc.):

```bash
export BELL_BIN_PATH="/path/to/repo"
```

---

## 📦 Code Utilities (`code/`)

Convenience wrappers for AI toolchain management.

| Script | Description |
|--------|-------------|
| `claudeu` | Install / update Claude CLI |
| `claudep` | Launch Claude with elevated permissions (`bypassPermissions`) |
| `codeu` | Install / update Codex, Gemini CLI, and OpenCode |
| `ngrok55551` | Start ngrok tunnel on port 55551 |

---

## 🗄️ Mini Utilities (`mini/`)

Personal tool collection with gum-powered TUI.

### NAS Mounter

Mount NAS shares via SMB with interactive feedback. This helps your AI Agent to mount from NAS without triggering system popups or permission dialogs. 

```bash
mount-nas <folder_name>
```

**Prerequisites:**
- Create `~/.mntrc` with your NAS credentials:
  ```bash
  export MOUNT_NAS='//user:password@host'
  ```
- NAS shares will be mounted to `~/mnt/<folder_name>`

---

## 🦊 PinchTab Toolchain (`pinchtab/`)

Browser instance management suite for [PinchTab](https://pinchtab.com).

### Core Scripts

| Script | Description |
|--------|-------------|
| `pinchtab-start` | Launch and provision browser instances |
| `pinchtab-cleanup` | Interactive dashboard to manage active sessions |
| `pinchtab-general` | Launch general-purpose profile (Port 19950) |
| `pinchtab-ask` | Launch AI assistant profile (Port 19951) |
| `pinchtab-youtube` | Launch YouTube-optimized profile (Port 19952) |

### Shortcuts (`pinchtab-shortcut/`)

Symlinks for quick access:
- `pts` → `pinchtab-start`
- `ptcleanup` → `pinchtab-cleanup`

---

## 🛠 Developer Tools (`scripts/`)

### Subtitle to TXT Converters

Convert VTT or SRT subtitle files to plain text with a gum-powered TUI.

```bash
vtt2txt --vtt <input.vtt> --txt <output.txt>
srt2txt --srt <input.srt> --txt <output.txt>
```

**Features:**
- Splits multi-line subtitle blocks into separate lines
- Auto-creates output directory if missing
- gum TUI with spinner and color-coded feedback
- Error handling for malformed files

**Requirements:**
- `webvtt-py` for VTT (`pip install webvtt-py`)
- `srt` for SRT (`pip install srt`)

---

## 📋 Requirements

- [Homebrew](https://brew.sh/)
- [gum](https://github.com/charmbracelet/gum) (Managed by `setup.sh`)
- [jq](https://stedolan.github.io/jq/)

---

> [!NOTE]
> All scripts follow the **AGENTS.md** constitution: English-only UI, comments, and documentation for maximum cross-compatibility.

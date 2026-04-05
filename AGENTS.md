# Constitutional Rules

## Communication & Documentation

- Use English for all user-facing text (UI, prompts, messages).
- Use English for all code comments and documentation.
- Use `gum` for all scripts.

## Directory Conventions

- `code/` — AI toolchain wrappers (claude, codex, gemini, opencode)
- `pinchtab/` — Browser instance management
- `scripts/` — User-facing tools (PATH-enabled, gum TUI)
- `_scripts/` — Internal Python utilities (private implementation)

## Script Standards

- Shebang: `#!/bin/bash` for shell, `#!/usr/bin/env python3` for Python
- All executable scripts must have `+x` permissions
- Shell scripts use gum for UI; fail fast with clear error messages
- Private `_scripts/` implementations are called by public wrappers in `scripts/`

## Environment Variables

- `BELL_BIN_PATH` — Points to project root; required by wrapper scripts

## Naming

- Prefix `_` (underscore) marks private/internal directories and scripts
- Public commands are discoverable via setup.sh PATH injection

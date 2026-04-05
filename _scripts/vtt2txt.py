#!/usr/bin/env python3
"""
VTT subtitle to TXT converter
Parses WebVTT format using webvtt-py and extracts plain text lines
"""

import sys
from pathlib import Path

import webvtt


def vtt_to_txt(vtt_path: str) -> list[str]:
    """
    Parse VTT file and extract all subtitle text segments.
    Returns a list of non-empty text lines.
    Each caption block may contain multiple lines - these are split into separate entries.
    """
    webvtt_segments = webvtt.read(vtt_path)
    lines: list[str] = []

    for segment in webvtt_segments:
        # Split multi-line caption blocks into separate lines
        for line in segment.text.strip().split("\n"):
            line = line.strip()
            if line:
                lines.append(line)

    return lines


def main():
    if len(sys.argv) < 3:
        print("Usage: python3 vtt2txt.py <vtt_file_path> <output_txt_path>")
        sys.exit(1)

    vtt_path = Path(sys.argv[1])
    txt_path = Path(sys.argv[2])

    if not vtt_path.exists():
        print(f"File not found: {vtt_path}")
        sys.exit(1)

    try:
        lines = vtt_to_txt(vtt_path)
        txt_path.parent.mkdir(parents=True, exist_ok=True)
        txt_path.write_text("\n".join(lines), encoding="utf-8")
        print(f"Output written to: {txt_path}")
    except Exception as e:
        print(f"Failed to parse VTT file: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()

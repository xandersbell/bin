#!/usr/bin/env python3
"""
SRT subtitle to TXT converter
Parses SRT format using the srt library and extracts plain text lines
"""

import sys
from pathlib import Path

import srt


def srt_to_txt(srt_path: str) -> list[str]:
    """
    Parse SRT file and extract all subtitle text segments.
    Returns a list of non-empty text lines.
    Each subtitle block may contain multiple lines - these are split into separate entries.
    """
    srt_content = Path(srt_path).read_text(encoding="utf-8")
    subtitles = srt.parse(srt_content)
    lines: list[str] = []

    for subtitle in subtitles:
        # Split multi-line subtitle blocks into separate lines
        for line in subtitle.content.strip().split("\n"):
            line = line.strip()
            if line:
                lines.append(line)

    return lines


def main():
    if len(sys.argv) < 3:
        print("Usage: python3 srt2txt.py <srt_file_path> <output_txt_path>")
        sys.exit(1)

    srt_path = Path(sys.argv[1])
    txt_path = Path(sys.argv[2])

    if not srt_path.exists():
        print(f"File not found: {srt_path}")
        sys.exit(1)

    try:
        lines = srt_to_txt(srt_path)
        txt_path.parent.mkdir(parents=True, exist_ok=True)
        txt_path.write_text("\n".join(lines), encoding="utf-8")
        print(f"Output written to: {txt_path}")
    except Exception as e:
        print(f"Failed to parse SRT file: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()

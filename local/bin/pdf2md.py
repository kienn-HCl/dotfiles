#!/usr/bin/env -S uv run --script
# /// script
# dependencies = [ "pymupdf4llm" ]
# ///

import sys
import pymupdf4llm


def main():
    if len(sys.argv) < 2 or 3 < len(sys.argv):
        print("Usage: pdf2md.py input.pdf output.md")
        print("     : pdf2md.py input.pdf")
        sys.exit(1)
    elif len(sys.argv) == 3:
        inputPdf = sys.argv[1]
        outpuPdf = sys.argv[2]
        mdText = pymupdf4llm.to_markdown(inputPdf)
        with open(outpuPdf, "w", encoding="utf-8") as f:
            f.write(mdText)
    elif len(sys.argv) == 2:
        inputPdf = sys.argv[1]
        mdText = pymupdf4llm.to_markdown(inputPdf)
        print(mdText)


main()

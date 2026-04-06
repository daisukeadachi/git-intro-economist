#!/bin/bash
# Converts a markdown file in files/ja/ or files/en/ to PDF in the corresponding pdf/ subfolder.
# Usage: echo '<hook JSON>' | bash md_to_pdf.sh

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

# Read file path from hook stdin JSON
FP=$(python3 -c "import json,sys; d=json.load(sys.stdin); print(d.get('tool_input',{}).get('file_path',''))" 2>/dev/null)

# Only act on .md files inside files/ja/ or files/en/
if [[ "$FP" != *.md ]]; then exit 0; fi

if [[ "$FP" == */files/ja/* ]]; then
    PDF_DIR="$(dirname "$FP")/pdf"
    EXTRA_OPTS=(-V mainfont="Hiragino Mincho ProN" -V CJKmainfont="Hiragino Mincho ProN")
elif [[ "$FP" == */files/en/* ]]; then
    PDF_DIR="$(dirname "$FP")/pdf"
    EXTRA_OPTS=()
else
    exit 0
fi

mkdir -p "$PDF_DIR"
BASENAME="$(basename "$FP" .md)"
PDF_PATH="$PDF_DIR/$BASENAME.pdf"

pandoc "$FP" -o "$PDF_PATH" \
    --pdf-engine=xelatex \
    -V geometry:margin=2.5cm \
    "${EXTRA_OPTS[@]}" \
    2>/dev/null

echo "{\"systemMessage\": \"PDF updated: $PDF_PATH\"}"

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Git introduction materials for economists, designed to onboard co-authors who are unfamiliar with version control. The approach is phased: start minimal, add complexity only after habits form.

## Repository Structure

```
files/
  ja/   Japanese guides (Markdown + PDF)
  en/   English guides (Markdown + PDF)
  */pdf/  Auto-generated PDFs (do not edit directly)
.claude/
  md_to_pdf.sh   Converts a files/ja/ or files/en/ .md file to PDF via pandoc
```

## Guide Files

| File | Contents |
|------|----------|
| `git_guide_coauthor_phase1.md` | Phase 1: 5 commands, 3 concepts, daily workflow |
| `git_guide_coauthor_phase2.md` | Phase 2: branches and pull requests |

Phase 3 content (git log/diff, revert/restore) is tracked in issue #2.

## PDF Generation

PDFs are generated with pandoc + xelatex:

- English: `pandoc <file>.md -o pdf/<file>.pdf --pdf-engine=xelatex -V geometry:margin=2.5cm`
- Japanese: same, plus `-V mainfont="Hiragino Mincho ProN" -V CJKmainfont="Hiragino Mincho ProN"`

A PostToolUse hook in `.claude/settings.local.json` runs `.claude/md_to_pdf.sh` automatically after any Edit/Write on files in `files/ja/` or `files/en/`. The same hook reminds to update the counterpart language file.

**Do not use emoji or special Unicode characters in the markdown files** — they cause missing-character warnings in xelatex and may render incorrectly in the PDF.

**Write markdown with PDF rendering in mind:**

- Avoid long inline lines containing `→` or similar non-breaking characters — xelatex cannot insert a line break at these points. Use a code block or sub-list instead.
- Keep table cells short. Long cell text does not wrap reliably in xelatex tables.
- Prefer code blocks (` ``` `) for multi-step command sequences rather than chaining them inline with arrows.
- Always put a blank line between a bold label (e.g. `**対処法：**`) and a following list — without it, pandoc treats the list as a continuation of the paragraph and collapses items onto one line.

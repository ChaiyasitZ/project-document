# project-document

LaTeX project (KMUTNB project report template) using XeLaTeX and Thai fonts.

## Quick Start

1. Open this folder in VS Code
2. Save any `.tex` file (auto-builds with XeLaTeX)
3. Press `Ctrl+Shift+P` → `LaTeX Workshop: View LaTeX PDF`
4. Click in PDF → jumps to source!

## Build Commands

```powershell
# Manual build
latexmk -xelatex -synctex=1 -interaction=nonstopmode Main.tex

# Clean build
latexmk -C
```

## VS Code Features

- **Auto-build**: Saves automatically trigger builds
- **PDF sync**: Click in PDF to jump to source
- **XeLaTeX**: Handles Thai fonts correctly
- **SyncTeX**: Enabled for PDF↔source navigation

## Files

- `Main.tex` - Main document
- `Class/project_report.cls` - Custom document class
- `Font/` - TH Sarabun fonts
- `Project_*.tex` - Chapters and sections
- `.vscode/` - VS Code LaTeX Workshop configuration
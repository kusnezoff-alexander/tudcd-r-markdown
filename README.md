# tudcd-r-markdown

This repo is meant to get you started more easily with your beamerlatex-slides written in R Markdown.

**Why?** - For those who prefer Markdown over LaTeX

**What?** - Template for creating presentations using the tud-cd using R-markdown
- What is R Markdown?: [R Markdown-Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/)

## 🕑 In Progress

- [ ] slide with several cols: [Tutorial](https://bookdown.org/yihui/rmarkdown-cookbook/multi-column.html)

## Beamer

Instructions on how to write slides in R-Markdown using the `beamerlatex` tudcd.

### Setup Instructions

1. Download tud-cd beamerstyle via `https://github.com/tud-cd/tud-cd/archive/master.zip`
2. Copy contents of `tud-cd-master/tex/latex/tud-beamerstyle/*` to your beamer-folder
    - eg on fedora: `cp ./tud-cd-master/tex/latex/tud-beamerstyle/* /usr/share/texlive/texmf-dist/tex/latex/beamer/`
```
cd /usr/share/texlive/texmf-dist/tex/latex/beamer/
curl https://raw.githubusercontent.com/tud-cd/tud-cd/refs/heads/master/tex/latex/tudmathposter/tudcolors.sty -o tudcolors.sty
```

3. Call `sudo texhash` (some kind of updating, see `man texhash` for details)
4. Validate that tud-styles can be found via `kpsewhich beamerthemetud.sty`
5. Clone this repo
6. Call `pandoc -s -t beamer slides.md -o slides.pdf --template template.tex --citeproc --slide-level=2`
    - when using [zotcite](https://github.com/jalvesaq/zotcite): type `:!pandoc -t beamer slides.md -s -o slides_test.pdf -F ~/.local/share/nvim/lazy/zotcite/python3/zotref.py --citeproc --slide-level=2 --csl=<path-to>/utils/ieee.csl`
7. Start making your slides based on this template

Prerequisites (for fedora):
```
sudo dnf install texlive-scheme-basic texlive-beamer texlive-opensans texlive-fontaxes
# or just:
sudo dnf install texlive-scheme-full
```

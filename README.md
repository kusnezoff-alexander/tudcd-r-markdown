# tudcd-r-markdown

This repo is meant to get you started more easily with your beamerlatex-slides written in R Markdown.

**Why?** - LaTeX is way too complex for most things. Just KISS (Keep It Simple Stupid), use Markdown and focus on the actual work!

**What?** - Template for creating presentations using the tud-cd using R-markdown
- What is R Markdown?: [R Markdown-Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/)

## Beamer

Instructions on how to write slides in R-Markdown using the `beamerlatex` tudcd.

### Setup Instructions

1. Download tud-cd beamerstyle via `https://github.com/tud-cd/tud-cd/archive/master.zip`
2. Copy contents of `tud-cd-master/tex/latex/tud-beamerstyle/*` to your beamer-folder
    - eg on fedora: `cp ./tud-cd-master/tex/latex/tud-beamerstyle/* /usr/share/texlive/texmf-dist/tex/latex/beamer/`
3. Call `sudo texhash` (some kind of updating, see `man texhash` for details)
4. Validate that tud-styles can be found via `kpsewhich beamerthemetud.sty`
5. Clone this repo
6. Call `pandoc -s -t beamer slides.md -o slides.pdf--template template.tex`
7. Start making your slides based on this template


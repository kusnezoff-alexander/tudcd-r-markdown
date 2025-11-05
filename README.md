# tudcd-r-markdown

This repo is meant to get you started more easily with your beamerlatex-slides written in R Markdown.
See [Slides](./slides.pdf) for example slides generated with this setup.

**Why?** - For those who prefer Markdown over LaTeX

**What?** - Template for creating presentations using the tud-cd using R-markdown
- What is R Markdown?: [R Markdown-Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/)

## Beamer

Instructions on how to write slides in R-Markdown using the `beamerlatex` tudcd.

### Setup Instructions

Usage:
```sh
git clone git@github.com:kusnezoff-alexander/tudcd-r-markdown.git
cd tudcd-r-markdown

export 	TEXINPUTS="theme/tudcd_til_2025/tud-cd-master/tex/latex/tud-beamerstyle:theme/tudcd_til_2025/tud-cd-master/tex/latex/tudmathposter:"
quarto preview slides.qmd   # live preview in browser
quarto render slides.qmd    # for actual rendering
```

and then edit `slides.qmd` (which contains some examples that can be used for inspo)

Debugging:
1. Call `sudo texhash` (some kind of updating, see `man texhash` for details)
2. Validate that tud-styles can be found via `kpsewhich beamerthemetud.sty`

Prerequisites (for fedora):
```
sudo dnf install texlive-scheme-basic texlive-beamer texlive-opensans texlive-fontaxes 'tex(svg.sty)' 'tex(trimspaces.sty)' 'tex(selnolig.sty)' texlive-xits texlive-tex-gyre dejavu-sans-fonts
# this doesnt work somehow..
sudo dnf install texlive-scheme-full
```
- if don't want to install `STIXGeneral` (which is used in the tud template) you can also use `STIXTwo`
    - just change this line in  eg `/usr/share/texlive/texmf-dist/tex/latex/beamer/beamerfontthemetud.sty`: `\setmathfont[range=\mathfrak]{STIXGeneral}` to `\setmathfont[range=\mathfrak]{STIX Two Math}`

## Common Errors

- don't put emojis into `::: notes`-section
- `npm install puppeteer` for rendering `markmap`s

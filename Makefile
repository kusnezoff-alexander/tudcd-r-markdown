all:
	# if not installed run: `sudo npm install --global mermaid-filter`
	pandoc -t beamer slides.md -s -o slides.pdf --template beamer-template.tex \
		--lua-filter=utils/fallback.lua --lua-filter=utils/emoji.lua --lua-filter=utils/mermaid.lua -F ~/.local/share/nvim/lazy/zotcite/python3/zotref.py \
		--citeproc --slide-level=2 --csl=utils/ieee.csl --include-in-header=./utils/emoji_font.tex --pdf-engine xelatex
	xdg-open slides.pdf


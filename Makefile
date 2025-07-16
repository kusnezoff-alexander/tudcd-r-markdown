all:
	pandoc -t beamer slides.md -s -o slides_test.pdf --template beamer-template.tex --lua-filter=utils/fallback.lua --lua-filter=utils/emoji.lua -F ~/.local/share/nvim/lazy/zotcite/python3/zotref.py --citeproc --slide-level=2 --csl=/tmp/code/tudcd-r-markdown/utils/ieee.csl --include-in-header=./utils/emoji_font.tex --pdf-engine xelatex


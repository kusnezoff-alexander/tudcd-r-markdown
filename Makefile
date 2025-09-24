.PHONY: clean

ZIP_URL := https://github.com/tud-cd/tud-cd/archive/master.zip
ZIP_FILE := theme/tudcd_master.zip
TARGET_DIR := theme/tudcd_til_2025
TUDCD_DIR := $(TARGET_DIR)/tud-cd-master

all:

	mkdir -p theme/tudcd_since_2025_lego theme/tudcd_til_2025
	if [ ! -d "$(TUDCD_DIR)" ]; then \
		echo "Downloading zip..."; \
		mkdir -p "$(TUDCD_DIR)"; \
		curl -L $(ZIP_URL) -o $(ZIP_FILE); \
		echo "unzipping zip..."; \
		mkdir -p $(TARGET_DIR); \
		unzip -o $(ZIP_FILE) -d $(TARGET_DIR); \
	else \
		echo "Directory '$(TUDCD_DIR)' exists, skipping."; \
	fi

	# if not installed run: `sudo npm install --global mermaid-filter`
	TEXINPUTS=theme/tudcd_til_2025/tud-cd-master/tex/latex/tud-beamerstyle:theme/tudcd_til_2025/tud-cd-master/tex/latex/tudmathposter: \
	pandoc -t beamer slides.md -s -o slides.pdf --template beamer-template.tex \
		--lua-filter=utils/fallback.lua --lua-filter=utils/emoji.lua --lua-filter=utils/mermaid.lua -F ~/.local/share/nvim/lazy/zotcite/python3/zotref.py \
		--citeproc --slide-level=2 --csl=utils/ieee.csl --include-in-header=./utils/emoji_font.tex --pdf-engine xelatex
	xdg-open slides.pdf

# Clean up everything
clean:
	rm -rf $(TARGET_DIR)/* theme/tudcd_since_2025_lego/* theme/*.zip


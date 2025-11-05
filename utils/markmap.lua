function CodeBlock(block)
  if block.classes:includes("markmap") then
    local markdown = block.text
    local tmp_md = "mindmap.md"
	local tmp_html = tmp_md:gsub("%.md$", ".html")
    local svg_path = "img/mindmap.svg"

    -- Write markdown content to file
    local f = io.open(tmp_md, "w")
    f:write(markdown)
    f:close()

    -- Run shell commands synchronously
    os.execute("npx markmap-cli " .. tmp_md .. " --no-open")
    os.execute("node utils/extract_markmap_to_svg.js " .. tmp_html .. " " .. svg_path)
    os.execute("rm " .. tmp_md .. " " .. tmp_html)

    -- Replace code block with image markdown
	-- return pandoc.Para{pandoc.Image({}, svg_path)}

	os.execute("rsvg-convert -f pdf -o img/mindmap.pdf " .. svg_path)
	-- return pandoc.RawBlock(
	--   "latex",
	--   "\\includegraphics[width=1.2\\linewidth]{img/mindmap.pdf}"
	-- )
	return pandoc.RawBlock(
	  "latex",
	  [[
	\begin{center}
	\vspace*{-2cm}% adjust vertical spacing before
	\hspace*{-0.9cm}% shift left by 0.5cm
	\raisebox{5.3cm}{% shift up by 0.3cm
	\resizebox{1.3\linewidth}{!}{\includegraphics{img/mindmap.pdf}}
	\vspace*{-1cm}% adjust vertical spacing before
	}%
	\end{center}
	]]
	)
-- 	os.execute("rsvg-convert -f pdf -o img/mindmap.pdf " .. svg_path)
--     local latex_code = string.format([[
-- \begin{frame}
--     \includesvg[width=0.7\textwidth]{%s}
-- \end{frame}
-- ]], svg_path)
--
--     return pandoc.RawBlock("latex", latex_code)
  end
end

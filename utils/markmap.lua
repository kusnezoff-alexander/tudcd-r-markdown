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
    os.execute("npx markmap-cli " .. tmp_md)
    os.execute("node utils/extract_markmap_to_svg.js " .. tmp_html .. " " .. svg_path)
    os.execute("rm " .. tmp_md .. " " .. tmp_html)

    -- Replace code block with image markdown
	-- return pandoc.Para{
	--   pandoc.Image({pandoc.Str("Some Caption")}, svg_path, {height="40%"})
	-- }
	return pandoc.Para{pandoc.Image({}, svg_path)}
  end
end

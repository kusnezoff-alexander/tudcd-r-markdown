function Str(el)
  local emoji_pattern = "[\xF0-\xF4][\x80-\xBF][\x80-\xBF][\x80-\xBF]"

  local replaced = false
  local text = el.text:gsub(emoji_pattern, function(e)
    replaced = true
    return "\\emoji{" .. e .. "}"
  end)

  if replaced then
    -- return as raw LaTeX instead of a normal string
    return pandoc.RawInline("latex", text)
  else
    return el
  end
end

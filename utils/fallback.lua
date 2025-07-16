local fallback_chars = {
  ["✓"] = true,
  ["✔"] = true,
  ["✗"] = true,
  ["ソ"] = true,
}

function Str(el)
  local replaced = false
  local chars = {}

  -- Iterate over UTF-8 characters properly using utf8.codes()
  for _, c in utf8.codes(el.text) do
    local ch = utf8.char(c)
    if fallback_chars[ch] then
      replaced = true
      table.insert(chars, "\\fallback{" .. ch .. "}")
    else
      table.insert(chars, ch)
    end
  end

  if replaced then
    return pandoc.RawInline("latex", table.concat(chars))
  else
    return el
  end
end

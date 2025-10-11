local pandoc = require 'pandoc'

-- Simple function to create a temp filename (unique-ish)
local function tempname(suffix)
  local random = math.random(100000, 999999)
  return os.tmpname():gsub("^/tmp/", "/tmp/mermaid_" .. random) .. suffix
end

local scale = 2
local mmdc_cmd = "mmdc"

local function run_cmd(cmd)
  local ok, _, code = os.execute(cmd)
  return code == 0
end

function CodeBlock(el)
  if el.classes:includes("mermaid") then
    local input_file = tempname(".mmd")
    local output_file = tempname(".pdf")

    local f = io.open(input_file, "w")
    f:write(el.text)
    f:close()

    local cmd = string.format('%s -i "%s" --outputFormat=pdf --pdfFit -o "%s" --scale %d', mmdc_cmd, input_file, output_file, scale)
    io.stderr:write("Running: " .. cmd .. "\n")

    if not run_cmd(cmd) then
      io.stderr:write("Error: mmdc command failed\n")
      return nil
    end

    return pandoc.Para{pandoc.Image({}, output_file)}
  end
end

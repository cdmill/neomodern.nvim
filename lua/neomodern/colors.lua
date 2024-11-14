local colors = require("neomodern.palette")

local function select_colors()
  local selected = { none = "none" }
  selected = vim.tbl_extend("force", selected, colors[vim.g.neomodern_config.theme])
  selected = vim.tbl_extend("force", selected, vim.g.neomodern_config.colors)
  return selected
end

return select_colors()

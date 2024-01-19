local colors = require("saguaro.palette")

local function select_colors()
  local selected = { none = "none" }
  selected = vim.tbl_extend("force", selected, colors[vim.g.saguaro.style])
  selected = vim.tbl_extend("force", selected, vim.g.saguaro.colors)
  return selected
end

return select_colors()

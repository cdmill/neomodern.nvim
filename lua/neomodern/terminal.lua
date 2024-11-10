local M = {}
local config = vim.g.neomodern_config
local style = vim.g.neomodern_config.style
local util = require("neomodern.util")
local palette = require("neomodern.palette")
local colormap = require("neomodern.palette").colormap

--- Returns the terminal colors associated with a theme, and optionally the entire
--- palette.
---@param with_palette boolean include the theme's palette colors
---@return table
function M.colors(with_palette)
  local scheme = {
    dim = util.darken(palette[style].bg, 0.9, "#000000"),
    black = colormap[style].black,
    grey = colormap[style].grey,
    red = colormap[style].red,
    orange = colormap[style].orange,
    green = colormap[style].green,
    yellow = colormap[style].yellow,
    blue = colormap[style].blue,
    purple = colormap[style].purple,
    magenta = colormap[style].magenta,
    cyan = colormap[style].cyan,
    white = colormap[style].white,
  }
  if with_palette then
    for k, v in pairs(palette[style]) do
      scheme[k] = v
    end
  end
  return scheme
end

function M.setup()
  if not config.term_colors then
    return
  end
  local colors = colormap[style]
  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_7 = colors.white
  vim.g.terminal_color_8 = colors.grey
  vim.g.terminal_color_9 = colors.orange
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_13 = colors.magenta
  vim.g.terminal_color_14 = colors.cyan
  vim.g.terminal_color_15 = colors.white
end

return M

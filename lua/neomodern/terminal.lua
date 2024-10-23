local M = {}
local config = vim.g.neomodern_config
local style = vim.g.neomodern_config.style
local palette = require("neomodern.palette")
local colormap = require("neomodern.palette").colormap

function M.colors()
  return {
    bg = palette[style].bg,
    fg = palette[style].fg,
    alt = palette[style].alt,
    inactive = palette[style].line,
    comment = palette[style].comment,
    black = colormap[style].black,
    selection = colormap[style].selection,
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

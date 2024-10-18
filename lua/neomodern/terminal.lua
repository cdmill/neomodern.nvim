local M = {}
local config = vim.g.neomodern_config
local style = vim.g.neomodern_config.style
local palette = require("neomodern.palette")

local color_map = {
  iceclimber = {
    black = "#2d2d2f",
    selection = "#2a2a31",
    grey = "#555568",
    red = "#e67e80",
    orange = "#e3a462",
    green = "#7da77e",
    yellow = "#dbbc8a",
    blue = "#86a3f0",
    purple = "#8a88db",
    magenta = "#e89bce",
    cyan = "#559ba3",
    white = "#bbbac1",
  },
  coffeecat = {
    black = "#191818",
    selection = "#383737",
    grey = "#6a6a6a",
    red = "#d47b7d",
    orange = "#e3a968",
    green = "#8fc490",
    yellow = "#e8cea0",
    blue = "#96b1fa",
    purple = "#9b9af5",
    magenta = "#e3afd1",
    cyan = "#b39581",
    white = "#bbbac1",
  },
  darkforest = {
    black = "#111312",
    selection = "#313b35",
    grey = "#7a8478",
    red = "#e67e80",
    orange = "#e69875",
    green = "#7da77e",
    yellow = "#dbbc7f",
    blue = "#a7c080",
    purple = "#abbceb",
    magenta = "#9094de",
    cyan = "#78b0a8",
    white = "#bbbac1",
  },
  roseprime = {
    black = "#111111",
    selection = "#262830",
    grey = "#666a82",
    red = "#c76f82",
    orange = "#e3a1ab",
    green = "#9bbdb8",
    yellow = "#d2af98",
    blue = "#95b1fc",
    purple = "#9b9af5",
    magenta = "#ad82a2",
    cyan = "#a3849b",
    white = "#afafdd",
  },
  daylight = {
    black = "#a7a7b0",
    selection = "#e1e1eb",
    grey = "#9b9ba3",
    red = "#e6050a",
    orange = "#db7302",
    green = "#41a642",
    yellow = "#fca921",
    blue = "#5d86f5",
    purple = "#6b65d6",
    magenta = "#e858b6",
    cyan = "#0293a3",
    white = "#111111",
  },
}

function M.colors()
  return {
    bg = palette[style].bg,
    fg = palette[style].fg,
    alt = palette[style].alt,
    inactive = palette[style].line,
    comment = palette[style].comment,
    black = color_map[style].black,
    selection = color_map[style].selection,
    grey = color_map[style].grey,
    red = color_map[style].red,
    orange = color_map[style].orange,
    green = color_map[style].green,
    yellow = color_map[style].yellow,
    blue = color_map[style].blue,
    purple = color_map[style].purple,
    magenta = color_map[style].magenta,
    cyan = color_map[style].cyan,
    white = color_map[style].white,
  }
end

function M.setup()
  if not config.term_colors then
    return
  end
  local colors = color_map[style]
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

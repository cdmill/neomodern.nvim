local M = {}
local config = vim.g.neomodern_config
local c = vim.g.neomodern_config.style
local palette = require("neomodern.palette")

local color_map = {
  iceclimber = {
    black = "#2d2d2f",
    selection = "#333336",
    grey = "#55555e",
    red = "#e67e80",
    orange = "#d6a56f",
    green = "#7da77e",
    yellow = "#dbbc8a",
    blue = "#8da0d6",
    purple = "#817faf",
    magenta = "#e29eca",
    cyan = "#559ba3",
    white = "#bbbac1",
  },
  coffeecat = {
    black = "#191818",
    selection = "#383737",
    grey = "#5e5a5a",
    red = "#d47b7d",
    orange = "#e3a968",
    green = "#8fc490",
    yellow = "#e8cea0",
    blue = "#abbceb",
    purple = "#9094de",
    magenta = "#cfa1bf",
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
  campfire = {
    black = "#121112",
    selection = "#413f4d",
    grey = "#686675",
    red = "#e67e80",
    orange = "#e69875",
    green = "#a7c080",
    yellow = "#dbbc8a",
    blue = "#8da0d6",
    purple = "#817faf",
    magenta = "#d6a56f",
    cyan = "#53a8b8",
    white = "#bbbac1",
  },
  roseprime = {
    black = "#111111",
    selection = "#26262a",
    grey = "#555555",
    red = "#ba7685",
    orange = "#a3b8b5",
    green = "#6b8f89",
    yellow = "#d2af98",
    blue = "#8192C7",
    purple = "#9879b0",
    magenta = "#ddadb4",
    cyan = "#a3849b",
    white = "#bbbac1",
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
    bg = palette[c].bg,
    fg = palette[c].fg,
    alt = palette[c].alt,
    inactive = palette[c].line,
    comment = palette[c].comment,
    black = color_map[c].black,
    selection = color_map[c].selection,
    grey = color_map[c].grey,
    red = color_map[c].red,
    orange = color_map[c].orange,
    green = color_map[c].green,
    yellow = color_map[c].yellow,
    blue = color_map[c].blue,
    purple = color_map[c].purple,
    magenta = color_map[c].magenta,
    cyan = color_map[c].cyan,
    white = color_map[c].white,
  }
end

function M.setup()
  if not config.term_colors then
    return
  end
  vim.g.terminal_color_0 = color_map[c].black
  vim.g.terminal_color_1 = color_map[c].red
  vim.g.terminal_color_2 = color_map[c].green
  vim.g.terminal_color_3 = color_map[c].yellow
  vim.g.terminal_color_4 = color_map[c].blue
  vim.g.terminal_color_5 = color_map[c].purple
  vim.g.terminal_color_6 = color_map[c].cyan
  vim.g.terminal_color_7 = color_map[c].white
  vim.g.terminal_color_8 = color_map[c].grey
  vim.g.terminal_color_9 = color_map[c].orange
  vim.g.terminal_color_10 = color_map[c].green
  vim.g.terminal_color_11 = color_map[c].yellow
  vim.g.terminal_color_12 = color_map[c].blue
  vim.g.terminal_color_13 = color_map[c].magenta
  vim.g.terminal_color_14 = color_map[c].cyan
  vim.g.terminal_color_15 = color_map[c].white
end

return M

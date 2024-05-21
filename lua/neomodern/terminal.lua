local M = {}
local config = vim.g.neomodern_config
local c = vim.g.neomodern_config.style
local palette = require("neomodern.palette")

local color_map = {
  iceclimber = {
    black = "#2d2d2f",
    grey = "#dbbc8a",
    red = "#e67e80",
    green = "#7da77e",
    yellow = "#dbbc8a",
    blue = "#8da0d6",
    magenta = "#817faf",
    cyan = "#559ba3",
    white = "#bbbac1",
  },
  coffeecat = {
    black = "#191818",
    grey = "#6e6a65",
    red = "#d47b7d",
    green = "#8fc490",
    yellow = "#e8cea0",
    blue = "#abbceb",
    magenta = "#9094de",
    cyan = "#b39581",
    fg = "#bbbac1",
  },
  darkforest = {
    black = "#111312",
    grey = "#7a8478",
    red = "#e67e80",
    green = "#7da77e",
    yellow = "#dbbc7f",
    blue = "#a7c080",
    magenta = "#d699b6",
    cyan = "#78b0a8",
    white = "#bbbac1",
  },
  campfire = {
    black = "#121112",
    grey = "#686675",
    red = "#e67e80",
    green = "#a7c080",
    yellow = "#dbbc8a",
    blue = "#8da0d6",
    magenta = "#817faf",
    cyan = "#53a8b8",
    white = "#bbbac1",
  },
  roseprime = {
    black = "#111111",
    grey = "#555555",
    red = "#ba7685",
    green = "#6b8f89",
    yellow = "#d2af98",
    blue = "#8192C7",
    magenta = "#a3849b",
    cyan = "#ddadb4",
    white = "#bbbac1",
  },
  daylight = {
    black = "#a7a7b0",
    grey = "#9b9ba3",
    red = "#e6050a",
    green = "#41a642",
    yellow = "#fca921",
    blue = "#5d86f5",
    magenta = "#6b65d6",
    cyan = "#0293a3",
    white = "#111111",
  },
}

function M.colors()
  return {
    bg = palette[c].bg,
    fg = palette[c].fg,
    black = color_map[c].black,
    grey = color_map[c].grey,
    red = color_map[c].red,
    green = color_map[c].green,
    yellow = color_map[c].yellow,
    blue = color_map[c].blue,
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
  vim.g.terminal_color_5 = color_map[c].magenta
  vim.g.terminal_color_6 = color_map[c].cyan
  vim.g.terminal_color_7 = color_map[c].white
  vim.g.terminal_color_8 = color_map[c].grey
  vim.g.terminal_color_9 = color_map[c].red
  vim.g.terminal_color_10 = color_map[c].green
  vim.g.terminal_color_11 = color_map[c].yellow
  vim.g.terminal_color_12 = color_map[c].blue
  vim.g.terminal_color_13 = color_map[c].magenta
  vim.g.terminal_color_14 = color_map[c].cyan
  vim.g.terminal_color_15 = color_map[c].white
end

return M

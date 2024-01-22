local c = require("saguaro.colors")
local cfg = vim.g.saguaro_config
local colors = {
  norm = c.bg4,
  ins = c.yellow,
  vis = c.purple,
  rep = c.blue,
  comm = c.orange,
  fg = c.fg,
  black = c.bg0,
  grey = c.bg3,
}

local saguaro = {
  inactive = {
    a = { bg = colors.grey, fg = colors.black, gui = "bold" },
    b = { bg = colors.grey, fg = colors.black },
    c = { bg = cfg.lualine.transparent and c.none or colors.grey, fg = colors.black },
  },
  normal = {
    a = { bg = colors.norm, fg = colors.black, gui = "bold" },
    b = { bg = colors.bg, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  insert = {
    a = { bg = colors.ins, fg = colors.black, gui = "bold" },
  },
  visual = {
    a = { bg = colors.vis, fg = colors.black, gui = "bold" },
  },
  replace = {
    a = { bg = colors.rep, fg = colors.black, gui = "bold" },
  },
  command = {
    a = { bg = colors.comm, fg = colors.black, gui = "bold" },
  },
}

return saguaro

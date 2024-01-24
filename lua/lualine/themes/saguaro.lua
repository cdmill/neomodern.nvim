local c = require("saguaro.colors")
local cfg = vim.g.saguaro_config
local colors = {
  norm = c.fg_dim,
  ins = c.yellow,
  vis = c.purple,
  rep = c.blue2,
  comm = c.orange,
  fg = c.fg,
  fg_dim = c.fg1,
  bg = c.bg3,
  bg2 = c.bg1,
  black = c.bg0,
  grey = c.bg3,
}

local saguaro = {
  normal = {
    a = { bg = colors.norm, fg = colors.black, gui = "bold" },
    b = { bg = colors.bg, fg = colors.fg },
    c = { bg = colors.bg2, fg = colors.fg_dim },
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

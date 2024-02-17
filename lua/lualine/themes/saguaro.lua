local c = require("saguaro.colors")
local cfg = vim.g.saguaro_config
local colors = {
  norm = c.c2,
  ins = c.c17,
  vis = c.c13,
  rep = c.c11,
  comm = c.c16,
  fg_dim = c.c5,
  bg = c.float,
  bg2 = c.line,
  black = c.bg,
  grey = c.bg3,
}

-- stylua: ignore
local saguaro = {
  normal = {
    a = { bg = cfg.lualine.transparent and c.none or colors.norm, fg = colors.norm, gui = "bold" },
    b = { bg = cfg.lualine.transparent and c.none or colors.bg, fg = colors.comm },
    c = { bg = cfg.lualine.transparent and c.none or colors.bg2, fg = colors.fg_dim },
  },
  insert = {
    a = { bg = cfg.lualine.transparent and c.none or colors.ins, fg = colors.ins, gui = "bold" },
  },
  visual = {
    a = { bg = cfg.lualine.transparent and c.none or colors.vis, fg = colors.vis, gui = "bold" },
  },
  replace = {
    a = { bg = cfg.lualine.transparent and c.none or colors.rep, fg = colors.rep, gui = "bold" },
  },
  command = {
    a = { bg = cfg.lualine.transparent and c.none or colors.comm, fg = colors.comm, gui = "bold" },
  },
}

return saguaro

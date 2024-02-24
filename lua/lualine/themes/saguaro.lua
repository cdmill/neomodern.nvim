local c = require("saguaro.colors")
local cfg = vim.g.saguaro_config
local colors = {
  norm = c.c7,
  ins = c.c13,
  vis = c.c10,
  rep = c.c8,
  comm = c.c12,
  fg_dim = c.c3,
  bg = c.float,
  bg2 = c.line,
  black = c.bg,
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

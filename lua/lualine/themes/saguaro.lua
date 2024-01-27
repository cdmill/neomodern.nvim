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

local c = require("saguaro.colors")
local cfg = vim.g.saguaro_config
local colors = {
  norm = c.c11,
  ins = c.c13,
  vis = c.c10,
  rep = c.c8,
  comm = c.c12,
  fg_dim = c.c3,
  bg_b = c.line,
  bg_c = c.float,
  black = c.bg,
  lightblue = c.c7,
}

-- stylua: ignore
local saguaro = {
  normal = {
    a = { bg = cfg.lualine.transparent and c.none or colors.norm, fg = cfg.lualine.transparent and colors.norm or colors.black, gui = "bold" },
    b = { bg = cfg.lualine.transparent and c.none or colors.bg_b, fg = colors.lightblue },
    c = { bg = cfg.lualine.transparent and c.none or colors.bg_c, fg = colors.fg_dim },
  },
  insert = {
    a = { bg = cfg.lualine.transparent and c.none or colors.ins, fg = cfg.lualine.transparent and colors.ins or colors.black, gui = "bold" },
  },
  visual = {
    a = { bg = cfg.lualine.transparent and c.none or colors.vis, fg = cfg.lualine.transparent and colors.vis or colors.black, gui = "bold" },
  },
  replace = {
    a = { bg = cfg.lualine.transparent and c.none or colors.rep, fg = cfg.lualine.transparent and colors.rep or colors.black, gui = "bold" },
  },
  command = {
    a = { bg = cfg.lualine.transparent and c.none or colors.comm, fg = cfg.lualine.transparent and colors.comm or colors.black, gui = "bold" },
  },
}

return saguaro

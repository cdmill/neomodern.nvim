local c = require("neomodern.colors")
local cfg = vim.g.neomodern_config
local colors = {
  norm = c.func,
  ins = c.constant,
  vis = c.builtin,
  rep = c.property,
  comm = c.type,
  fg_dim = c.comment,
  vcs = c.alt,
  dark = c.dim,
  bg_b = c.visual,
  bg_c = c.line,
}

-- stylua: ignore
local neomodern = {
  normal = {
    a = { bg = cfg.ui.plain and c.none or colors.norm, fg = cfg.ui.plain and colors.norm or colors.dark, gui = cfg.ui.lualine.bold and "bold" or "none"},
    b = { bg = cfg.ui.plain and c.none or colors.bg_b, fg = colors.vcs },
    c = { bg = cfg.ui.plain and c.none or colors.bg_c, fg = colors.fg_dim },
  },
  insert = {
    a = { bg = cfg.ui.plain and c.none or colors.ins, fg = cfg.ui.plain and colors.ins or colors.dar, gui = cfg.ui.lualine.bold and "bold" or "none" },
  },
  visual = {
    a = { bg = cfg.ui.plain and c.none or colors.vis, fg = cfg.ui.plain and colors.vis or colors.dar, gui = cfg.ui.lualine.bold and "bold" or "none" },
  },
  replace = {
    a = { bg = cfg.ui.plain and c.none or colors.rep, fg = cfg.ui.plain and colors.rep or colors.dar, gui = cfg.ui.lualine.bold and "bold" or "none" },
  },
  command = {
    a = { bg = cfg.ui.plain and c.none or colors.comm, fg = cfg.ui.plain and colors.comm or colors.dar, gui = cfg.ui.lualine.bold and "bold" or "none" },
  },
}

return neomodern

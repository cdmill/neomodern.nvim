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
    a = { bg = cfg.plugin.lualine.plain and c.none or colors.norm, fg = cfg.plugin.lualine.plain and colors.norm or colors.dark, gui = cfg.plugin.lualine.bold and "bold" or "none"},
    b = { bg = cfg.plugin.lualine.plain and c.none or colors.bg_b, fg = colors.vcs },
    c = { bg = cfg.plugin.lualine.plain and c.none or colors.bg_c, fg = colors.fg_dim },
  },
  insert = {
    a = { bg = cfg.plugin.lualine.plain and c.none or colors.ins, fg = cfg.plugin.lualine.plain and colors.ins or colors.dark, gui = cfg.plugin.lualine.bold and "bold" or "none" },
  },
  visual = {
    a = { bg = cfg.plugin.lualine.plain and c.none or colors.vis, fg = cfg.plugin.lualine.plain and colors.vis or colors.dark, gui = cfg.plugin.lualine.bold and "bold" or "none" },
  },
  replace = {
    a = { bg = cfg.plugin.lualine.plain and c.none or colors.rep, fg = cfg.plugin.lualine.plain and colors.rep or colors.dark, gui = cfg.plugin.lualine.bold and "bold" or "none" },
  },
  command = {
    a = { bg = cfg.plugin.lualine.plain and c.none or colors.comm, fg = cfg.plugin.lualine.plain and colors.comm or colors.dark, gui = cfg.plugin.lualine.bold and "bold" or "none" },
  },
}

return neomodern

local c = require("neomodern.terminal").colors()
local cfg = vim.g.neomodern_config
local colors = {
  norm = c.blue,
  ins = c.yellow,
  vis = c.purple,
  rep = c.cyan,
  comm = c.orange,
  fg_dim = c.comment,
  vcs = c.alt,
  bg_b = c.selection,
  bg_c = c.inactive,
  dark = c.bg,
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

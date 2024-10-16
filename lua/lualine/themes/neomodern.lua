local colors = require("neomodern.terminal").colors()
local cfg = vim.g.neomodern_config
local c = {
  norm = colors.blue,
  ins = colors.yellow,
  vis = colors.purple,
  rep = colors.cyan,
  comm = colors.orange,
  fg_dim = colors.comment,
  vcs = colors.alt,
  bg_b = colors.selection,
  bg_c = colors.inactive,
  dark = colors.bg,
  none = "none",
}

-- stylua: ignore
local neomodern = {
  normal = {
    a = { bg = cfg.plugin.lualine.plain and c.none or c.norm, fg = cfg.plugin.lualine.plain and c.norm or c.dark, gui = cfg.plugin.lualine.bold and "bold" or "none"},
    b = { bg = cfg.plugin.lualine.plain and c.none or c.bg_b, fg = c.vcs },
    c = { bg = cfg.plugin.lualine.plain and c.none or c.bg_c, fg = c.fg_dim },
  },
  insert = {
    a = { bg = cfg.plugin.lualine.plain and c.none or c.ins, fg = cfg.plugin.lualine.plain and c.ins or c.dark, gui = cfg.plugin.lualine.bold and "bold" or "none" },
  },
  visual = {
    a = { bg = cfg.plugin.lualine.plain and c.none or c.vis, fg = cfg.plugin.lualine.plain and c.vis or c.dark, gui = cfg.plugin.lualine.bold and "bold" or "none" },
  },
  replace = {
    a = { bg = cfg.plugin.lualine.plain and c.none or c.rep, fg = cfg.plugin.lualine.plain and c.rep or c.dark, gui = cfg.plugin.lualine.bold and "bold" or "none" },
  },
  command = {
    a = { bg = cfg.plugin.lualine.plain and c.none or c.comm, fg = cfg.plugin.lualine.plain and c.comm or c.dark, gui = cfg.plugin.lualine.bold and "bold" or "none" },
  },
}

return neomodern

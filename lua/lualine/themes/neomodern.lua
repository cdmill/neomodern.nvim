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
  dark = c.bg,
  bg_b = c.float,
  bg_c = c.line,
}

-- stylua: ignore
local neomodern = {
  normal = {
    a = { bg = cfg.plain_ui and c.none or colors.norm, fg = cfg.plain_ui and colors.norm or colors.dark, gui = "bold" },
    b = { bg = cfg.plain_ui and c.none or colors.bg_b, fg = colors.vcs },
    c = { bg = cfg.plain_ui and c.none or colors.bg_c, fg = colors.fg_dim },
  },
  insert = {
    a = { bg = cfg.plain_ui and c.none or colors.ins, fg = cfg.plain_ui and colors.ins or colors.dark, gui = "bold" },
  },
  visual = {
    a = { bg = cfg.plain_ui and c.none or colors.vis, fg = cfg.plain_ui and colors.vis or colors.dark, gui = "bold" },
  },
  replace = {
    a = { bg = cfg.plain_ui and c.none or colors.rep, fg = cfg.plain_ui and colors.rep or colors.dark, gui = "bold" },
  },
  command = {
    a = { bg = cfg.plain_ui and c.none or colors.comm, fg = cfg.plain_ui and colors.comm or colors.dark, gui = "bold" },
  },
}

return neomodern

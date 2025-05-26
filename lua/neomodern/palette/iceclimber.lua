local Util = require("neomodern.util")

---@type neomodern.Theme
local M = {
    alt = "#abbceb",
    alt_bg = "#111113",
    bg = "#171719",
    comment = "#555568",
    constant = "#86a3f0",
    fg = "#bbbac1",
    func = "#cc93b8",
    keyword = "#8a88db",
    line = "#1d1d22",
    number = "#cfa18c",
    operator = "#9b99a3",
    property = "#629da3",
    string = "#6b6b99",
    type = "#a8a6de",
    visual = "#2a2a31",
    diag_red = "#e67e80",
    diag_blue = "#778fd1",
    diag_yellow = "#ad9368",
    diag_green = "#658c6d",
}

---@type neomodern.Theme.Terminal
M.colormap = {
    c00 = M.comment, -- black
    c01 = M.diag_red, -- red
    c02 = Util.blend(M.diag_green, 0.6, M.bg), -- green
    c03 = M.diag_yellow, -- yellow
    c04 = M.constant, -- blue
    c05 = M.string, -- magenta
    c06 = Util.blend(M.property, 0.6, M.bg), -- cyan
    c07 = Util.blend(M.fg, 0.6, M.bg), -- white
    c08 = M.comment, -- bright black
    c09 = M.func, -- bright red
    c0A = M.diag_green, -- bright green
    c0B = M.number, -- bright yellow
    c0C = M.alt, -- bright blue
    c0D = M.type, -- bright magenta
    c0E = M.property, -- bright cyan
    c0F = M.fg, -- bright white
}

return M

local Util = require("neomodern.util")

---@type neomodern.Theme
local M = {
    alt = "#a8a6f5",
    alt_bg = "#111111",
    bg = "#121315",
    comment = "#666a82",
    constant = "#95b1fc",
    fg = "#adadcc",
    func = "#c4959c",
    keyword = "#6397cf",
    line = "#16171b",
    number = "#cfa18c",
    operator = "#838196",
    property = "#ad82a2",
    string = "#d2af98",
    type = "#9bbdb8",
    visual = "#262830",
    diag_red = "#ba5f60",
    diag_blue = "#95b1fc",
    diag_yellow = "#ad9368",
    diag_green = "#6b8f89",
}

---@type neomodern.Theme.Terminal
M.colormap = {
    c00 = M.comment, -- black
    c01 = M.diag_red, -- red
    c02 = Util.blend(M.type, 0.6, M.bg), -- green
    c03 = M.func, -- yellow
    c04 = Util.blend(M.constant, 0.6, M.bg), -- blue
    c05 = Util.blend(M.alt, 0.6, M.bg), -- magenta
    c06 = Util.blend(M.keyword, 0.6, M.bg), -- cyan
    c07 = Util.blend(M.fg, 0.6, M.bg), -- white
    c08 = M.comment, -- bright black
    c09 = M.property, -- bright red
    c0A = M.type, -- bright green
    c0B = M.string, -- bright yellow
    c0C = M.constant, -- bright blue
    c0D = M.alt, -- bright magenta
    c0E = M.keyword, -- bright cyan
    c0F = M.fg, -- bright white
}

return M

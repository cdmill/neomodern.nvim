local Util = require("neomodern.util")

---@type neomodern.Theme
local M = {
    alt = "#a7ab93",
    alt_bg = "#111111",
    bg = "#161616",
    comment = "#696969",
    constant = "#b0b58a",
    fg = "#adacac",
    func = "#808796",
    keyword = "#a18b7f",
    line = "#1b1c1d",
    number = "#b5ae84",
    operator = "#856b6c",
    property = "#9c797d",
    string = "#8a968f",
    type = "#8a879c",
    visual = "#333333",
    diag_red = "#9e5560",
    diag_blue = "#808796",
    diag_yellow = "#969375",
    diag_green = "#8bab85",
}

---@type neomodern.Theme.Terminal
M.colormap = {
    c00 = M.comment, -- black
    c01 = M.diag_red, -- red
    c02 = Util.blend(M.string, 0.6, M.bg), -- green
    c03 = M.constant, -- yellow
    c04 = Util.blend(M.func, 0.6, M.bg), -- blue
    c05 = Util.blend(M.type, 0.6, M.bg), -- magenta
    c06 = Util.blend(M.keyword, 0.6, M.bg), -- cyan
    c07 = Util.blend(M.fg, 0.6, M.bg), -- white
    c08 = M.comment, -- bright black
    c09 = M.property, -- bright red
    c0A = M.string, -- bright green
    c0B = M.number, -- bright yellow
    c0C = M.func, -- bright blue
    c0D = M.type, -- bright magenta
    c0E = M.keyword, -- bright cyan
    c0F = M.fg, -- bright white
}

return M

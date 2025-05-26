local Util = require("neomodern.util")

---@type neomodern.Theme
local M = {
    alt = "#a69e6f",
    alt_bg = "#161617",
    bg = "#1b1c1d",
    comment = "#767777",
    constant = "#868db5",
    fg = "#bbbac1",
    func = "#8bab85",
    keyword = "#72966c",
    line = "#222324",
    number = "#d6a9b3",
    operator = "#b08c7d",
    property = "#748fa6",
    string = "#a2ad7b",
    type = "#bbc7b1",
    visual = "#323334",
    diag_red = "#9e5560",
    diag_blue = "#748fa6",
    diag_yellow = "#9c9167",
    diag_green = "#8bab85",
}

---@type neomodern.Theme.Terminal
M.colormap = {
    c00 = M.comment, -- black
    c01 = M.diag_red, -- red
    c02 = M.keyword, -- green
    c03 = M.string, -- yellow
    c04 = Util.blend(M.property, 0.6, M.bg), -- blue
    c05 = Util.blend(M.number, 0.6, M.bg), -- magenta
    c06 = Util.blend(M.constant, 0.6, M.bg), -- cyan
    c07 = Util.blend(M.fg, 0.6, M.bg), -- white
    c08 = M.comment, -- bright black
    c09 = M.operator, -- bright red
    c0A = M.func, -- bright green
    c0B = M.type, -- bright yellow
    c0C = M.property, -- bright blue
    c0D = M.number, -- bright magenta
    c0E = M.constant, -- bright cyan
    c0F = M.fg, -- bright white
}

return M

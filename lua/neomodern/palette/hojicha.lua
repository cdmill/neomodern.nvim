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
    line = "#1a1a1a",
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
    colormap = {},
}

M.colormap = {
    black = M.alt_bg,
    grey = M.comment,
    red = M.property,
    orange = M.keyword,
    green = M.string,
    yellow = M.number,
    blue = M.func,
    purple = M.type,
    magenta = M.alt,
    cyan = M.constant,
    white = M.fg,
}

return M

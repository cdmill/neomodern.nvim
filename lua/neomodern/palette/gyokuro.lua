---@type neomodern.Theme
local M = {
    alt = "#a69e6f",
    alt_bg = "#161617",
    bg = "#1b1c1d",
    builtin = "#d6a9b3",
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
    diag_blue = "#6a7dc4",
    diag_yellow = "#9c9167",
    diag_green = "#8bab85",
    colormap = {},
}

M.colormap = {
    black = M.alt_bg,
    grey = M.comment,
    red = M.builtin,
    orange = M.keyword,
    green = M.string,
    yellow = M.constant,
    blue = M.func,
    purple = M.property,
    magenta = M.alt,
    cyan = M.type,
    white = M.fg,
}

return M

---@type neomodern.Theme
local M = {
    alt = "#abbceb",
    bg = "#171719",
    builtin = "#cc93b8",
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
    colormap = {},
}

M.colormap = {
    black = "#2d2d2f",
    grey = M.comment,
    red = M.diag_red,
    orange = M.number,
    green = M.property,
    yellow = M.func,
    blue = M.constant,
    purple = M.keyword,
    magenta = M.type,
    cyan = M.string,
    white = M.fg,
}

return M

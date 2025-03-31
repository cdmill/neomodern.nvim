---@type neomodern.Theme
local M = {
    alt = "#5d86f5",
    alt_bg = "#000000",
    bg = "#ffffff",
    comment = "#9b9ba3",
    constant = "#f79b07",
    fg = "#111111",
    func = "#2e62f2",
    keyword = "#4b46b8",
    line = "#f0f0f5",
    number = "#cfa18c",
    operator = "#111111",
    property = "#0293a3",
    string = "#2ca32d",
    type = "#db7302",
    visual = "#d2d2dc",
    diag_red = "#e6050a",
    diag_blue = "#3462e3",
    diag_yellow = "#fca921",
    diag_green = "#41a642",
    colormap = {},
}

M.colormap = {
    black = M.alt_bg,
    grey = M.comment,
    red = M.diag_red,
    orange = M.type,
    green = M.string,
    yellow = M.constant,
    blue = M.func,
    purple = M.keyword,
    magenta = M.keyword,
    cyan = M.property,
    white = M.fg,
}

return M

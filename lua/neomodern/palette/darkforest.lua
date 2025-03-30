---@type neomodern.Theme
local M = {
    alt = "#d6a56f",
    bg = "#181b1b",
    builtin = "#c76f82",
    comment = "#7a8478",
    constant = "#d699b6",
    fg = "#bbbac1",
    func = "#a7c080",
    keyword = "#7da77e",
    line = "#1e2323",
    number = "#cfa18c",
    operator = "#c3c082",
    property = "#78b0a8",
    string = "#dbbc7f",
    type = "#e69875",
    visual = "#313b35",
    diag_red = "#e67e80",
    diag_blue = "#78b0a8",
    diag_yellow = "#ad9368",
    diag_green = "#a7c080",
    colormap = {},
}

M.colormap = {
    black = "#111312",
    grey = M.comment,
    red = M.diag_red,
    orange = M.type,
    green = M.keyword,
    yellow = M.string,
    blue = M.func,
    purple = M.operator,
    magenta = M.builtin,
    cyan = M.property,
    white = M.fg,
}

return M

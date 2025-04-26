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
    black = M.alt_bg,
    grey = M.comment,
    red = M.diag_red,
    orange = M.func,
    green = M.type,
    yellow = M.string,
    blue = M.constant,
    purple = M.alt,
    magenta = M.property,
    cyan = M.keyword,
    white = M.fg,
}

return M

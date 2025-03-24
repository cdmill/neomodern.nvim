---@class (exact) Theme
---@field alt string highlight
---@field bg string background
---@field builtin string default/builtin library
---@field comment string comments
---@field constant string constants
---@field fg string foreground
---@field float string numbers
---@field func string functions
---@field keyword string keywords
---@field line string line highlights: e.g. cursor line
---@field number string number/boolean
---@field operator string operators
---@field property string class properties
---@field string string strings
---@field type string types
---@field visual string visual selection
---@field diag_red string diagnostics red color (e.g. error)
---@field diag_blue string diagnostics blue color (e.g. hint)
---@field diag_yellow string diagnostics yellow color (e.g. warning)
---@field diag_green string diagnostics green color (e.g. diffadd)

---@class Colorscheme
---@field iceclimber Theme
---@field coffeecat Theme
---@field darkforest Theme
---@field roseprime Theme
---@field daylight Theme
local M = {}

M.iceclimber = {
    alt = "#abbceb",
    bg = "#171719",
    builtin = "#cc93b8",
    comment = "#555568",
    constant = "#86a3f0",
    fg = "#bbbac1",
    float = "#222228",
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

M.coffeecat = {
    alt = "#cfa991",
    bg = "#1e1d1c",
    builtin = "#d67287",
    comment = "#6a6a6a",
    constant = "#ebc686",
    fg = "#bbbac1",
    float = "#2b2a2a",
    func = "#a2bafa",
    keyword = "#e8a85f",
    line = "#262524",
    number = "#cfa18c",
    operator = "#9b99a3",
    property = "#ebabd5",
    string = "#8ab56d",
    type = "#78bfc4",
    visual = "#383737",
    diag_red = "#d47b7d",
    diag_blue = "#96b1fa",
    diag_yellow = "#e8cea0",
    diag_green = "#8fc490",
}

M.darkforest = {
    alt = "#d6a56f",
    bg = "#181b1b",
    builtin = "#c76f82",
    comment = "#7a8478",
    constant = "#d699b6",
    fg = "#bbbac1",
    float = "#222928",
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
}

M.roseprime = {
    alt = "#9b9af5",
    bg = "#121315",
    builtin = "#c76f82",
    comment = "#666a82",
    constant = "#95b1fc",
    fg = "#adadcc",
    float = "#16171b",
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

M.daylight = {
    alt = "#5d86f5",
    bg = "#ffffff",
    builtin = "#e858b6",
    comment = "#9b9ba3",
    constant = "#f79b07",
    fg = "#111111",
    float = "#e8e8eb",
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
}

M.colormap = {
    iceclimber = {
        black = "#2d2d2f",
        grey = M.iceclimber.comment,
        red = M.iceclimber.diag_red,
        orange = M.iceclimber.number,
        green = M.iceclimber.property,
        yellow = M.iceclimber.func,
        blue = M.iceclimber.constant,
        purple = M.iceclimber.keyword,
        magenta = M.iceclimber.type,
        cyan = M.iceclimber.string,
        white = M.iceclimber.fg,
    },
    coffeecat = {
        black = "#121110",
        grey = M.coffeecat.comment,
        red = M.coffeecat.builtin,
        orange = M.coffeecat.keyword,
        green = M.coffeecat.string,
        yellow = M.coffeecat.constant,
        blue = M.coffeecat.func,
        purple = M.coffeecat.property,
        magenta = M.coffeecat.alt,
        cyan = M.coffeecat.type,
        white = M.coffeecat.fg,
    },
    darkforest = {
        black = "#111312",
        grey = M.darkforest.comment,
        red = M.darkforest.diag_red,
        orange = M.darkforest.type,
        green = M.darkforest.keyword,
        yellow = M.darkforest.string,
        blue = M.darkforest.func,
        purple = M.darkforest.operator,
        magenta = M.darkforest.builtin,
        cyan = M.darkforest.property,
        white = M.darkforest.fg,
    },
    roseprime = {
        black = "#111111",
        grey = M.roseprime.comment,
        red = M.roseprime.builtin,
        orange = M.roseprime.func,
        green = M.roseprime.type,
        yellow = M.roseprime.string,
        blue = M.roseprime.constant,
        purple = M.roseprime.alt,
        magenta = M.roseprime.property,
        cyan = M.roseprime.keyword,
        white = M.roseprime.fg,
    },
    daylight = {
        black = "#000000",
        grey = M.daylight.comment,
        red = M.daylight.diag_red,
        orange = M.daylight.type,
        green = M.daylight.string,
        yellow = M.daylight.constant,
        blue = M.daylight.func,
        purple = M.daylight.keyword,
        magenta = M.daylight.builtin,
        cyan = M.daylight.property,
        white = M.daylight.fg,
    },
}

return M

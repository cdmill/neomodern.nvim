local c = require("neomodern.colors")
local config = vim.g.neomodern_config
local util = require("neomodern.util")

c.darkgutter = util.darken(c.bg, 0.85, "#000000")

local M = {
    ColorColumn = { bg = c.line },
    Conceal = { fg = c.func, bg = config.transparent and c.none or c.bg },
    CurSearch = { fg = c.type, bg = c.visual },
    Cursor = { fmt = "reverse" },
    vCursor = { fmt = "reverse" },
    iCursor = { fmt = "reverse" },
    lCursor = { fmt = "reverse" },
    CursorIM = { fmt = "reverse" },
    CursorColumn = { bg = c.line },
    CursorLine = { bg = c.line },
    CursorLineNr = {
        fg = config.alt_culnr_hl and c.alt or c.fg,
        bg = (
            (config.cursorline_gutter and c.line or nil)
            or (config.dark_gutter and c.darkgutter or nil)
        ) or c.bg,
    },
    CursorLineSign = { bg = config.cursorline_gutter and c.line or c.none },
    CursorLineFold = { fg = c.fg, bg = config.cursorline_gutter and c.line or c.none },
    Debug = { fg = c.operator },
    debugPC = { fg = c.diag_red },
    debugBreakpoint = { fg = c.diag_red },
    DiffAdd = { bg = util.darken(c.diag_green, 0.3, c.bg) },
    DiffChange = { bg = util.darken(c.diag_blue, 0.2, c.bg) },
    DiffDelete = { bg = util.darken(c.diag_red, 0.4, c.bg) },
    DiffText = { fg = c.fg },
    Directory = { fg = c.func },
    ErrorMsg = { fg = c.diag_red, fmt = "bold" },
    EndOfBuffer = { fg = config.show_eob and c.comment or c.bg },
    FloatBorder = { fg = c.comment, bg = config.plain_float and c.none or c.float },
    FloatTitle = { fg = c.comment, bg = config.plain_float and c.none or c.float },
    Folded = { fg = c.comment, bg = config.transparent and c.none or c.line },
    FoldColumn = {
        fg = c.comment,
        bg = (
            (config.transparent and c.none or nil)
            or (config.dark_gutter and c.darkgutter or nil)
        ) or c.bg,
    },
    IncSearch = { fg = c.type, bg = c.visual },
    LineNr = {
        fg = c.comment,
        bg = config.dark_gutter and c.darkgutter or c.bg,
    },
    MatchParen = { fg = c.fg, bg = c.visual, fmt = "bold" },
    ModeMsg = { fg = c.fg, fmt = "bold" },
    MoreMsg = { fg = c.func, fmt = "bold" },
    MsgSeparator = { fg = c.string, bg = c.line, fmt = "bold" },
    NonText = { fg = c.comment },
    Normal = { fg = c.fg, bg = config.transparent and c.none or c.bg },
    NormalFloat = {
        fg = c.fg,
        bg = (config.transparent or config.plain_float) and c.none or c.float,
    },
    Pmenu = { fg = c.fg, bg = config.plain_float and c.none or c.visual },
    PmenuSbar = { bg = c.float },
    PmenuSel = { fg = c.diag_blue, bg = config.transparent and c.none or c.float },
    PmenuThumb = { bg = c.visual },
    Question = { fg = c.constant },
    QuickFixLine = { fg = c.func, fmt = "underline" },
    Search = { fg = c.diag_blue, bg = c.visual },
    SignColumn = {
        fg = c.fg,
        bg = (
            (config.transparent and c.none or nil)
            or (config.dark_gutter and c.darkgutter or nil)
        ) or c.bg,
    },
    SpecialKey = { fg = c.comment },
    SpellBad = { fg = c.none, fmt = "undercurl", sp = c.diag_red },
    SpellCap = { fg = c.none, fmt = "undercurl", sp = c.diag_yellow },
    SpellLocal = { fg = c.none, fmt = "undercurl", sp = c.diag_blue },
    SpellRare = { fg = c.none, fmt = "undercurl", sp = c.diag_blue },
    StatusLine = { fg = c.comment, bg = c.line },
    StatusLineTerm = { fg = c.comment, bg = c.line },
    StatusLineNC = { fg = c.comment, bg = c.line },
    StatusLineTermNC = { fg = c.comment, bg = c.line },
    Substitute = { fg = c.type, bg = c.visual },
    TabLine = { fg = c.comment, bg = c.line },
    TabLineFill = { fg = c.comment, bg = c.line },
    TabLineSel = { fg = c.diag_blue, bg = c.visual },
    Terminal = { fg = c.fg, bg = config.transparent and c.none or c.bg },
    ToolbarButton = { fg = c.bg, bg = c.visual },
    ToolbarLine = { fg = c.fg },
    Visual = { fg = c.alt, bg = c.visual },
    VisualNOS = { fg = c.none, bg = c.comment, fmt = "underline" },
    WarningMsg = { fg = c.diag_yellow, fmt = "bold" },
    Whitespace = { fg = c.comment },
    WildMenu = { fg = c.diag_blue, bg = util.darken(c.diag_blue, 0.1, c.bg) },
    WinSeparator = { fg = c.comment },
}

return M

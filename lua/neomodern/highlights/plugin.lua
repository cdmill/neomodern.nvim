local c = require("neomodern.colors")
local config = vim.g.neomodern_config
local util = require("neomodern.util")

local diagnostics_error_color = c.diag_red
local diagnostics_hint_color = c.diag_blue
local diagnostics_warn_color = c.diag_yellow
local diagnostics_info_color = c.diag_blue

local M = {}

M.lsp = {
    DiagnosticError = { fg = c.diag_red },
    DiagnosticHint = { fg = c.diag_blue },
    DiagnosticInfo = { fg = c.diag_blue, fmt = "italic" },
    DiagnosticWarn = { fg = c.diag_yellow },

    DiagnosticVirtualTextError = {
        bg = config.diagnostics.background
                and util.darken(diagnostics_error_color, 0.1, c.bg)
            or c.none,
        fg = diagnostics_error_color,
    },
    DiagnosticVirtualTextWarn = {
        bg = config.diagnostics.background
                and util.darken(diagnostics_warn_color, 0.1, c.bg)
            or c.none,
        fg = diagnostics_warn_color,
    },
    DiagnosticVirtualTextInfo = {
        bg = config.diagnostics.background
                and util.darken(diagnostics_info_color, 0.1, c.bg)
            or c.none,
        fg = diagnostics_info_color,
    },
    DiagnosticVirtualTextHint = {
        bg = config.diagnostics.background
                and util.darken(diagnostics_hint_color, 0.1, c.bg)
            or c.none,
        fg = diagnostics_hint_color,
    },

    DiagnosticUnderlineError = {
        fmt = config.diagnostics.undercurl and "undercurl" or "underline",
        sp = c.diag_red,
    },
    DiagnosticUnderlineHint = {
        fmt = config.diagnostics.undercurl and "undercurl" or "underline",
        sp = c.diag_blue,
    },
    DiagnosticUnderlineInfo = {
        fmt = config.diagnostics.undercurl and "undercurl" or "underline",
        sp = c.diag_blue,
    },
    DiagnosticUnderlineWarn = {
        fmt = config.diagnostics.undercurl and "undercurl" or "underline",
        sp = c.diag_yellow,
    },

    LspReferenceText = { bg = c.visual },
    LspReferenceWrite = { bg = c.visual },
    LspReferenceRead = { bg = c.visual },

    LspCodeLens = {
        fg = c.keyword,
        bg = util.darken(c.keyword, 0.1, c.bg),
        fmt = config.code_style.comments,
    },
    LspCodeLensSeparator = { fg = c.comment },
}

-- stylua: ignore start
M.lsp.LspDiagnosticsDefaultError = M.lsp.DiagnosticError
M.lsp.LspDiagnosticsDefaultHint = M.lsp.DiagnosticHint
M.lsp.LspDiagnosticsDefaultInformation = M.lsp.DiagnosticInfo
M.lsp.LspDiagnosticsDefaultWarning = M.lsp.DiagnosticWarn
M.lsp.LspDiagnosticsUnderlineError = M.lsp.DiagnosticUnderlineError
M.lsp.LspDiagnosticsUnderlineHint = M.lsp.DiagnosticUnderlineHint
M.lsp.LspDiagnosticsUnderlineInformation = M.lsp.DiagnosticUnderlineInfo
M.lsp.LspDiagnosticsUnderlineWarning = M.lsp.DiagnosticUnderlineWarn
M.lsp.LspDiagnosticsVirtualTextError = M.lsp.DiagnosticVirtualTextError
M.lsp.LspDiagnosticsVirtualTextWarning = M.lsp.DiagnosticVirtualTextWarn
M.lsp.LspDiagnosticsVirtualTextInformation = M.lsp.DiagnosticVirtualTextInfo
M.lsp.LspDiagnosticsVirtualTextHint = M.lsp.DiagnosticVirtualTextHint
-- stylua: ignore end

M.special = {
    LazyNormal = { bg = c.float },
    MasonNormal = { bg = c.float },
}

M.cmp = {
    CmpItemAbbr = { fg = c.fg },
    CmpItemAbbrDeprecated = { fg = c.comment, fmt = "strikethrough" },
    CmpItemAbbrMatch = { fg = c.type },
    CmpItemAbbrMatchFuzzy = { fg = c.type, fmt = "underline" },
    CmpItemMenu = { fg = c.comment },
    CmpItemKind = { fg = c.comment, fmt = config.plugin.cmp.reverse and "reverse" },
}

M.blink = {
    BlinkCmpKind = { fg = c.comment, fmt = config.plugin.cmp.reverse and "reverse" },
}

M.diffview = {
    DiffviewFilePanelTitle = { fg = c.func, fmt = "bold" },
    DiffviewFilePanelCounter = { fg = c.alt, fmt = "bold" },
    DiffviewFilePanelFileName = { fg = c.fg },
    DiffviewNormal = { link = "Normal" },
    DiffviewCursorLine = { link = "CursorLine" },
    DiffviewVertSplit = { link = "VertSplit" },
    DiffviewSignColumn = { link = "SignColumn" },
    DiffviewStatusLine = { link = "StatusLine" },
    DiffviewStatusLineNC = { link = "StatusLineNC" },
    DiffviewEndOfBuffer = { link = "EndOfBuffer" },
    DiffviewFilePanelRootPath = { fg = c.comment },
    DiffviewFilePanelPath = { fg = c.comment },
    DiffviewFilePanelInsertions = { fg = c.fg },
    DiffviewFilePanelDeletions = { fg = c.operator },
    DiffviewStatusAdded = { fg = c.fg },
    DiffviewStatusUntracked = { fg = c.diag_blue },
    DiffviewStatusModified = { fg = c.diag_blue },
    DiffviewStatusRenamed = { fg = c.diag_blue },
    DiffviewStatusCopied = { fg = c.diag_blue },
    DiffviewStatusTypeChange = { fg = c.diag_blue },
    DiffviewStatusUnmerged = { fg = c.diag_blue },
    DiffviewStatusUnknown = { fg = c.diag_red },
    DiffviewStatusDeleted = { fg = c.diag_red },
    DiffviewStatusBroken = { fg = c.diag_red },
}

M.gitsigns = {
    GitSignsAdd = { fg = c.diag_green },
    GitSignsAddLn = { fg = c.diag_green },
    GitSignsAddNr = { fg = c.diag_green },
    GitSignsAddCul = { fg = c.diag_green, bg = c.line },
    GitSignsChange = { fg = c.diag_blue },
    GitSignsChangeLn = { fg = c.diag_blue },
    GitSignsChangeNr = { fg = c.diag_blue },
    GitSignsChangeCul = { fg = c.diag_blue, bg = c.line },
    GitSignsDelete = { fg = c.diag_red },
    GitSignsDeleteLn = { fg = c.diag_red },
    GitSignsDeleteNr = { fg = c.diag_red },
    GitSignsDeleteCul = { fg = c.diag_red, bg = c.line },
}

M.neogit = {
    NeogitBranch = { fg = c.alt },
    NeogitUntrackedfiles = { fg = c.diag_blue, fmt = "italic" },
    NeogitUnpulledchanges = { fg = c.diag_blue, fmt = "italic" },
    NeogitUnmergedchanges = { fg = c.keyword, fmt = "bolditalic" },
    NeogitDiffAdd = { link = "DiffAdd" },
    NeogitDiffAddHighlight = { link = "DiffAdd" },
    NeogitDiffAddCursor = { bg = util.darken(c.diag_green, 0.2, c.bg) },
    NeogitDiffDelete = { link = "DiffDelete" },
    NeogitDiffDeleteHighlight = { link = "DiffDelete" },
    NeogitDiffDeleteCursor = {
        bg = util.darken(c.diag_red, 0.2, c.bg),
    },
    NeogitDiffContext = { bg = c.float },
    NeogitDiffContextHighlight = { bg = c.float },
    NeogitDiffContextCursor = { bg = c.line },
    NeogitSectionHeader = { fg = c.func },
    NeogitHunkHeader = { fg = c.comment },
    NeogitHunkHeaderHighlight = { fg = c.comment, fmt = "italic" },
    NeogitHunkHeaderCursor = { fg = c.comment, fmt = "bolditalic" },
    NeogitHunkMergeHeader = { fg = c.diag_blue, bg = c.line, fmt = "bold" },
    NeogitHunkMergeHeaderHighlight = { fg = c.diag_blue, bg = c.line, fmt = "italic" },
    NeogitHunkMergeHeaderCursor = { fg = c.diag_blue, bg = c.line, fmt = "bolditalic" },
}

M.neo_tree = {
    NeoTreeNormal = { fg = c.fg, bg = config.transparent and c.none or c.bg },
    NeoTreeNormalNC = { fg = c.fg, bg = config.transparent and c.none or c.bg },
    NeoTreeVertSplit = {
        fg = c.comment,
        bg = config.transparent and c.none or c.comment,
    },
    NeoTreeWinSeparator = {
        fg = c.comment,
        bg = config.transparent and c.none or c.comment,
    },
    NeoTreeEndOfBuffer = {
        fg = config.show_eob and c.comment or c.bg,
        bg = config.transparent and c.none or c.bg,
    },
    NeoTreeRootName = { fg = c.type, fmt = "bold" },
    NeoTreeGitAdded = { fg = c.fg },
    NeoTreeGitDeleted = { fg = c.diag_red },
    NeoTreeGitModified = { fg = c.diag_blue },
    NeoTreeGitConflict = { fg = c.diag_red, fmt = "bold,italic" },
    NeoTreeGitUntracked = { fg = c.diag_red, fmt = "italic" },
    NeoTreeIndentMarker = { fg = c.comment },
    NeoTreeSymbolicLinkTarget = { fg = c.diag_blue },
}

M.nvim_tree = {
    NvimTreeNormal = { fg = c.fg, bg = config.transparent and c.none or c.bg },
    NvimTreeVertSplit = { fg = c.float, bg = config.transparent and c.none or c.bg },
    NvimTreeEndOfBuffer = {
        fg = config.show_eob and c.comment or c.bg,
        bg = config.transparent and c.none or c.bg,
    },
    NvimTreeRootFolder = { fg = c.type, fmt = "bold" },
    NvimTreeGitDirty = { fg = c.diag_blue },
    NvimTreeGitNew = { fg = c.fg },
    NvimTreeGitDeleted = { fg = c.diag_red },
    NvimTreeSpecialFile = { fg = c.diag_yellow, fmt = "underline" },
    NvimTreeIndentMarker = { fg = c.fg },
    NvimTreeImageFile = { fg = c.visual },
    NvimTreeSymlink = { fg = c.diag_blue },
    NvimTreeFolderName = { fg = c.func },
}

M.obsidian = {
    ObsidianTodo = { link = "@markup.list.unchecked" },
    ObsidianDone = { link = "@markup.list.checked" },
    ObsidianRightArrow = { bold = true, fg = c.fg },
    ObsidianTilde = { bold = true, fg = c.fg },
    ObsidianBullet = { link = "@markup.list" },
    ObsidianRefText = { link = "@markup.link" },
    ObsidianExtLinkIcon = { link = "@markup.strikethrough" },
    ObsidianTag = { link = "@markup.list.unchecked" },
    ObsidianHighlightText = {
        bg = util.darken(c.constant, 0.1, c.bg),
        fg = c.constant,
    },
}

M.snacks = {
    SnacksDashboardIcon = { fg = c.func },
    SnacksDashboardDesc = { fg = c.func },
    SnacksDashboardFile = { fg = c.alt },
    SnacksDashboardSpecial = { fg = c.type },
}

local telescope_ui = {
    borderless = {
        TelescopeTitle = { fg = c.fg },
        TelescopeNormal = { bg = c.float },
        TelescopePromptNormal = { bg = c.visual, fmt = "bold" },
        TelescopePromptBorder = { fg = c.visual, bg = c.visual },
        TelescopePreviewNormal = {
            fg = util.darken(c.float, 0.6, c.bg),
            bg = util.darken(c.float, 0.6, c.bg),
        },
        TelescopePreviewBorder = {
            fg = util.darken(c.float, 0.6, c.bg),
            bg = util.darken(c.float, 0.6, c.bg),
        },
        TelescopeResultsNormal = { fg = c.comment, bg = c.float },
        TelescopeResultsBorder = { fg = c.float, bg = c.float },
        TelescopePromptPrefix = { fg = c.func },
        TelescopeSelectionBorder = { fg = c.float, bg = c.float },
        TelescopeSelectionCaret = { fg = c.type },
        TelescopeSelection = { fg = c.fg },
        TelescopeMatching = { fg = c.type, fmt = "bold" },
    },
    bordered = {
        TelescopeTitle = { fg = c.comment },
        TelescopeBorder = { fg = c.comment },
        TelescopeMatching = { fg = c.type, fmt = "bold" },
        TelescopePromptPrefix = { fg = c.type },
        TelescopeSelection = {
            fg = c.diag_blue,
            bg = config.transparent and c.none or c.float,
        },
        TelescopeSelectionCaret = { fg = c.diag_blue },
        TelescopeResultsNormal = { fg = c.fg },
    },
}

M.telescope = telescope_ui[config.plugin.telescope]

M.dashboard = {
    DashboardShortCut = { fg = c.func },
    DashboardHeader = { fg = c.keyword },
    DashboardCenter = { fg = c.fg },
    DashboardFooter = { fg = c.func, fmt = "italic" },
}

M.ministarter = {
    MiniStarterHeader = { fg = c.keyword },
    MiniStarterFooter = { fg = c.keyword },
}

M.indent_blankline = {
    IndentBlanklineIndent1 = { fg = c.func },
    IndentBlanklineIndent2 = { fg = c.fg },
    IndentBlanklineIndent3 = { fg = c.keyword },
    IndentBlanklineIndent4 = { fg = c.comment },
    IndentBlanklineIndent5 = { fg = c.alt },
    IndentBlanklineIndent6 = { fg = c.operator },
    IndentBlanklineChar = { fg = c.comment, fmt = "nocombine" },
    IndentBlanklineContextChar = { fg = c.comment, fmt = "nocombine" },
    IndentBlanklineContextStart = { sp = c.comment, fmt = "underline" },
    IndentBlanklineContextSpaceChar = { fmt = "nocombine" },
    IblIndent = { fg = c.comment, fmt = "nocombine" },
    IblWhitespace = { fg = c.comment, fmt = "nocombine" },
    IblScope = { fg = c.comment, fmt = "nocombine" },
}

local lsp_kind_icons_color = {
    Default = c.keyword,
    Array = c.keyword,
    Boolean = c.func,
    Class = c.type,
    Color = c.fg,
    Constant = c.constant,
    Constructor = c.constant,
    Enum = c.constant,
    EnumMember = c.property,
    Event = c.type,
    Field = c.property,
    File = c.fg,
    Folder = c.func,
    Function = c.func,
    Interface = c.constant,
    Key = c.keyword,
    Keyword = c.keyword,
    Method = c.func,
    Module = c.constant,
    Namespace = c.constant,
    Null = c.type,
    Number = c.func,
    Object = c.type,
    Operator = c.operator,
    Package = c.constant,
    Property = c.property,
    Reference = c.type,
    Snippet = c.type,
    String = c.string,
    Struct = c.keyword,
    Text = c.fg,
    TypeParameter = c.type,
    Unit = c.fg,
    Value = c.fg,
    Variable = c.fg,
}

if not config.plugin.plain then
    for kind, color in pairs(lsp_kind_icons_color) do
        M.cmp["CmpItemKind" .. kind] =
            { fg = color, fmt = config.plugin.cmp.reverse and "reverse" }
        M.cmp["BlinkCmpKind" .. kind] =
            { fg = color, fmt = config.plugin.cmp.reverse and "reverse" }
    end
end

return M

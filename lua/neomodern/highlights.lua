local c = require("neomodern.colors")
local config = vim.g.neomodern_config
local util = require("neomodern.util")

local M = {}
local hl = { plugins = {} }

hl.common = {
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
        bg = config.cursorline_gutter and c.line or c.none,
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
    FoldColumn = { fg = c.comment, bg = config.transparent and c.none or c.bg },
    IncSearch = { fg = c.type, bg = c.visual },
    LineNr = { fg = c.comment },
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
    SignColumn = { fg = c.fg, bg = config.transparent and c.none or c.bg },
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

hl.syntax = {
    Boolean = { fg = c.number }, -- boolean constants
    Character = { fg = c.string }, -- character constants
    Comment = { fg = c.comment, fmt = config.code_style.comments }, -- comments
    Constant = { fg = c.constant, fmt = config.code_style.constants }, -- (preferred) any constant
    Delimiter = { fg = c.fg }, -- delimiter characters
    Float = { fg = c.number }, -- float constants
    Function = { fg = c.func, fmt = config.code_style.functions }, -- functions
    Error = { fg = c.diag_red }, -- (preferred) any erroneous construct
    Exception = { fg = c.diag_red }, -- 'try', 'catch', 'throw'
    Identifier = { fg = c.property, fmt = config.code_style.variables }, -- (preferred) any variable
    Keyword = { fg = c.keyword, fmt = config.code_style.keywords }, -- any other keyword
    Conditional = { fg = c.keyword, fmt = config.code_style.conditionals }, -- conditionals
    -- Repeat = { fg = c.keyword, fmt = config.code_style.keywords }, -- loop keywords: 'for', 'while' etc
    -- Label = { fg = c.keyword }, -- 'case', 'default', etc
    Number = { fg = c.number }, -- number constant
    Operator = { fg = c.operator, fmt = config.code_style.operators }, -- '+', '*', 'sizeof' etc
    PreProc = { fg = c.string }, -- (preferred) generic preprocessor
    -- Define = { fg = c.comment }, -- preprocessor '#define'
    Include = { fg = c.constant, fmt = config.code_style.keywords }, -- preprocessor '#include'
    Macro = { fg = c.number, fmt = config.code_style.constants }, -- macros
    -- PreCondit = { fg = c.comment }, -- preprocessor conditionals '#if', '#endif' etc
    Special = { fg = c.type }, -- (preferred) any special symbol
    SpecialChar = { fg = c.keyword }, -- special character in a constant
    -- SpecialComment = { fg = c.keyword, fmt = config.code_style.comments }, -- special things inside comments
    -- Tag = { fg = c.func }, -- can use <C-]> on this
    Statement = { fg = c.keyword }, -- (preferred) any statement
    String = { fg = c.string, fmt = config.code_style.strings }, -- string constants
    Title = { fg = c.keyword },
    Type = { fg = c.type }, -- (preferred) 'int', 'long', 'char' etc
    -- StorageClass = { fg = c.constant, fmt = config.code_style.keywords }, -- 'static', 'volatile' etc
    -- Structure = { fg = c.constant }, -- 'struct', 'union', 'enum' etc
    -- Typedef = { fg = c.constant }, -- 'typedef'
    Todo = { fg = util.darken(c.comment, 0.6, c.fg), fmt = "bolditalic" }, -- (preferred) 'TODO' keywords in comments
}

-- stylua: ignore
if vim.version()["minor"] > 0.8 then
    hl.treesitter = {
        -- identifiers
        ["@variable"] = { fg = c.fg, fmt = config.code_style.variables }, -- any variable that does not have another highlight
        ["@variable.builtin"] = hl.syntax["Type"], -- variable names that are defined by the language, like 'this' or 'self'
        ["@variable.member"] = { fg = c.property }, -- fields
        ["@variable.parameter"] = { fg = c.alt }, -- parameters of a function
        -- ["@variable.field"] = { fg = c.property }, -- fields

        -- ["@constant"] = { link = "Constant" }, -- constants
        ["@constant.builtin"] = hl.syntax["Type"], -- constants that are defined by the language, like 'nil' in lua
        -- ["@constant.macro"] = { link = "Macro" }, -- constants that are defined by macros like 'NULL' in c

        -- ["@label"] = { link = "Label" }, -- labels
        ["@module"] = hl.syntax["Type"], -- modules and namespaces

        -- literals
        -- ["@string"] = { link = "String" }, -- strings
        ["@string.documentation"] = config.colored_docstrings and hl.syntax["String"] or hl.syntax["Comment"], -- doc strings
        ["@string.regexp"] = hl.syntax["SpecialChar"], -- regex
        ["@string.escape"] = hl.syntax["SpecialChar"], -- escape characters within string
        ["@string.special.symbol"] = hl.syntax["Identifier"],
        -- ["@string.special.url"] = { fg = c.func }, -- urls, links, emails

        -- ["@character"] = { link = "String" }, -- character literals
        -- ["@character.special"] = hl.syntax["SpecialChar"], -- special characters

        -- ["@boolean"] = { link = "Constant" }, -- booleans
        -- ["@number"] = { link = "Number" }, -- all numbers
        -- ["@number.float"] = { link = "Number" }, -- floats

        -- types
        ["@type"] = hl.syntax["Type"], -- types
        -- ["@type.builtin"] = hl.syntax["Type"], --builtin types
        -- ["@type.definition"] = hl.syntax["Typedef"], -- typedefs
        -- ["@type.qualifier"]

        ["@attribute"] = hl.syntax["Function"], -- attributes, like <decorators> in python
        -- ["@property"] = { fg = c.property }, --same as TSField

        -- functions
        -- ["@function"] = { link = "Function" }, -- functions
        -- ["@function.builtin"] = hl.syntax["Function"], --builtin functions
        -- ["@function.macro"] = { link = "Macro" }, -- macro defined functions
        -- ["@function.call"]
        -- ["@function.method"]
        -- ["@function.method.call"]

        -- ["@constructor"] = { fg = c.constant, fmt = config.code_style.functions }, -- constructor calls and definitions
        ["@constructor.lua"] = { fg = config.colored_brackets and c.alt or c.fg, fmt = config.code_style.functions, }, -- constructor calls and definitions, `= { }` in lua
        ["@operator"] = hl.syntax["Operator"], -- operators, like `+`

        -- keywords
        ["@keyword"] = { fg = c.keyword, fmt = config.code_style.keywords }, -- keywords that don't fall in previous categories
        ["@keyword.exception"] = hl.syntax["Exception"], -- exception related keywords
        -- ["@keyword.import"] = hl.syntax["PreProc"], -- keywords used to define a function
        ["@keyword.conditional"] = { fg = c.keyword, fmt = config.code_style.conditionals, }, -- keywords for conditional statements
        ["@keyword.operator"] = { fg = c.keyword, fmt = config.code_style.operators }, -- keyword operator (eg, 'in' in python)
        ["@keyword.return"] = { fg = c.keyword, fmt = config.code_style.keyword_return }, -- keywords used to define a function
        -- ["@keyword.function"] = hl.syntax["Function"], -- keywords used to define a function
        -- ["@keyword.import"] = hl.syntax["Include"], -- includes, like '#include' in c, 'require' in lua
        -- ["@keyword.storage"] = hl.syntax["StorageClass"], -- visibility/life-time 'static'
        -- ["@keyword.repeat"] = hl.syntax["Repeat"], -- for keywords related to loops

        -- punctuation
        ["@punctuation.delimiter"] = { fg = c.fg }, -- delimiters, like `; . , `
        ["@punctuation.bracket"] = { fg = config.colored_brackets and c.alt or c.fg }, -- brackets and parentheses
        ["@punctuation.special"] = hl.syntax["SpecialChar"], -- punctuation that does not fall into above categories, like `{}` in string interpolation

        -- comment
        -- ["@comment"]
        ["@comment.error"] = { fg = util.darken(c.comment, 0.4, c.diag_red), fmt = "bolditalic" },
        ["@comment.warning"] = { fg = util.darken(c.comment, 0.4, c.diag_yellow), fmt = "bolditalic" },
        ["@comment.note"] = { fg = util.darken(c.comment, 0.4, c.diag_blue), fmt = "bolditalic" },

        -- markup
        ["@markup"] = { fg = c.fg }, -- text in markup language
        ["@markup.strong"] = { fg = c.fg, fmt = "bold" }, -- bold
        ["@markup.italic"] = { fg = c.fg, fmt = "italic" }, -- italic
        ["@markup.underline"] = { fg = c.fg, fmt = "underline" }, -- underline
        ["@markup.strikethrough"] = { fg = c.comment, fmt = "strikethrough" }, -- strikethrough
        ["@markup.heading"] = { fg = c.keyword, fmt = config.code_style.headings }, -- markdown titles
        ["@markup.quote.markdown"] = { fg = c.comment }, -- quotes with >
        ["@markup.link.uri"] = { fg = c.alt, fmt = "underline" }, -- urls, links, emails
        ["@markup.link"] = { fg = c.type }, -- text references, footnotes, citations, etc
        ["@markup.list"] = { fg = c.func },
        ["@markup.list.checked"] = { fg = c.func }, -- todo checked
        ["@markup.list.unchecked"] = { fg = c.func }, -- todo unchecked
        ["@markup.raw"] = { fg = c.func }, -- inline code in markdown
        ["@markup.math"] = { fg = c.type }, -- math environments, like `$$` in latex

        -- diff
        ["@diff.plus"] = { fg = c.diag_green }, -- added text (diff files)
        ["@diff.minus"] = { fg = c.diag_red }, -- removed text (diff files)
        ["@diff.delta"] = { fg = c.diag_blue }, -- changed text (diff files)

        -- tags
        -- ["@tag"]
        ["@tag.attribute"] = hl.syntax["Identifier"], -- tags, like in html
        ["@tag.delimiter"] = { fg = c.fg }, -- tag delimiter < >
    }
    if vim.version()["minor"] > 0.9 then
        hl.lsp = {
            ["@lsp.typemod.variable.global"] = { fg = util.darken(c.constant, 0.8, c.bg)},
            ["@lsp.typemod.keyword.documentation"] = { fg = util.darken(c.type, 0.8, c.bg)},
            ["@lsp.type.namespace"] = { fg = util.darken(c.constant, 0.8, c.bg)},
            ["@lsp.type.macro"] = hl.syntax["Macro"],
            ["@lsp.type.parameter"] = hl.treesitter["@variable.parameter"],
            ["@lsp.type.lifetime"] = { fg = c.type, fmt = "italic" },
            ["@lsp.type.readonly"] = { fg = c.constant, fmt = "italic" },
            ["@lsp.mod.readonly"] = { fg = c.constant, fmt = "italic" },
            ["@lsp.mod.typeHint"] = hl.syntax["Type"],
        }
    end
end

local diagnostics_error_color = c.diag_red
local diagnostics_hint_color = c.diag_blue
local diagnostics_warn_color = c.diag_yellow
local diagnostics_info_color = c.diag_blue

hl.plugins.lsp = {
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
hl.plugins.lsp.LspDiagnosticsDefaultError = hl.plugins.lsp.DiagnosticError
hl.plugins.lsp.LspDiagnosticsDefaultHint = hl.plugins.lsp.DiagnosticHint
hl.plugins.lsp.LspDiagnosticsDefaultInformation = hl.plugins.lsp.DiagnosticInfo
hl.plugins.lsp.LspDiagnosticsDefaultWarning = hl.plugins.lsp.DiagnosticWarn
hl.plugins.lsp.LspDiagnosticsUnderlineError = hl.plugins.lsp.DiagnosticUnderlineError
hl.plugins.lsp.LspDiagnosticsUnderlineHint = hl.plugins.lsp.DiagnosticUnderlineHint
hl.plugins.lsp.LspDiagnosticsUnderlineInformation = hl.plugins.lsp.DiagnosticUnderlineInfo
hl.plugins.lsp.LspDiagnosticsUnderlineWarning = hl.plugins.lsp.DiagnosticUnderlineWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextError = hl.plugins.lsp.DiagnosticVirtualTextError
hl.plugins.lsp.LspDiagnosticsVirtualTextWarning = hl.plugins.lsp.DiagnosticVirtualTextWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextInformation = hl.plugins.lsp.DiagnosticVirtualTextInfo
hl.plugins.lsp.LspDiagnosticsVirtualTextHint = hl.plugins.lsp.DiagnosticVirtualTextHint
-- stylua: ignore end

hl.plugins.special = {
    LazyNormal = { bg = c.float },
    MasonNormal = { bg = c.float },
}

hl.plugins.cmp = {
    CmpItemAbbr = { fg = c.fg },
    CmpItemAbbrDeprecated = { fg = c.comment, fmt = "strikethrough" },
    CmpItemAbbrMatch = { fg = c.type },
    CmpItemAbbrMatchFuzzy = { fg = c.type, fmt = "underline" },
    CmpItemMenu = { fg = c.comment },
    CmpItemKind = { fg = c.comment, fmt = config.plugin.cmp.reverse and "reverse" },
}

hl.plugins.blink = {
    BlinkCmpKind = { fg = c.comment, fmt = config.plugin.cmp.reverse and "reverse" },
}

hl.plugins.diffview = {
    DiffviewFilePanelTitle = { fg = c.func, fmt = "bold" },
    DiffviewFilePanelCounter = { fg = c.alt, fmt = "bold" },
    DiffviewFilePanelFileName = { fg = c.fg },
    DiffviewNormal = hl.common.Normal,
    DiffviewCursorLine = hl.common.CursorLine,
    DiffviewVertSplit = hl.common.VertSplit,
    DiffviewSignColumn = hl.common.SignColumn,
    DiffviewStatusLine = hl.common.StatusLine,
    DiffviewStatusLineNC = hl.common.StatusLineNC,
    DiffviewEndOfBuffer = hl.common.EndOfBuffer,
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

hl.plugins.gitsigns = {
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

hl.plugins.neogit = {
    NeogitBranch = { fg = c.alt },
    NeogitUntrackedfiles = { fg = c.diag_blue, fmt = "italic" },
    NeogitUnpulledchanges = { fg = c.diag_blue, fmt = "italic" },
    NeogitUnmergedchanges = { fg = c.keyword, fmt = "bolditalic" },
    NeogitDiffAdd = hl.common.DiffAdd,
    NeogitDiffAddHighlight = hl.common.DiffAdd,
    NeogitDiffAddCursor = { bg = util.darken(c.diag_green, 0.2, c.bg) },
    NeogitDiffDelete = hl.common.DiffDelete,
    NeogitDiffDeleteHighlight = hl.common.DiffDelete,
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

hl.plugins.neo_tree = {
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

hl.plugins.nvim_tree = {
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

hl.plugins.obsidian = {
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

hl.plugins.snacks = {
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

hl.plugins.telescope = telescope_ui[config.plugin.telescope]

hl.plugins.dashboard = {
    DashboardShortCut = { fg = c.func },
    DashboardHeader = { fg = c.keyword },
    DashboardCenter = { fg = c.fg },
    DashboardFooter = { fg = c.func, fmt = "italic" },
}

hl.plugins.ministarter = {
    MiniStarterHeader = { fg = c.keyword },
    MiniStarterFooter = { fg = c.keyword },
}

hl.plugins.indent_blankline = {
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

local function vim_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        vim.api.nvim_command(
            string.format(
                "highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
                group_name,
                group_settings.fg or "none",
                group_settings.bg or "none",
                group_settings.sp or "none",
                group_settings.fmt or "none"
            )
        )
    end
end

function M.setup()
    if not config.plugin.cmp.plain then
        for kind, color in pairs(lsp_kind_icons_color) do
            hl.plugins.cmp["CmpItemKind" .. kind] =
                { fg = color, fmt = config.plugin.cmp.reverse and "reverse" }
            hl.plugins.cmp["BlinkCmpKind" .. kind] =
                { fg = color, fmt = config.plugin.cmp.reverse and "reverse" }
        end
    end

    vim_highlights(hl.common)
    vim_highlights(hl.syntax)
    vim_highlights(hl.treesitter)
    if hl.lsp then
        vim_highlights(hl.lsp)
    end
    for _, group in pairs(hl.plugins) do
        vim_highlights(group)
    end

    -- user defined highlights: vim_highlights function cannot be used because it sets an
    -- attribute to none if not specified
    local function replace_color(prefix, color_name)
        if not color_name then
            return ""
        end
        if color_name:sub(1, 1) == "$" then
            local name = color_name:sub(2, -1)
            color_name = c[name]
            if not color_name then
                vim.schedule(function()
                    vim.notify(
                        'neomodern.nvim: unknown color "' .. name .. '"',
                        vim.log.levels.ERROR,
                        { title = "neomodern.nvim" }
                    )
                end)
                return ""
            end
        end
        return prefix .. "=" .. color_name
    end

    for group_name, group_settings in pairs(vim.g.neomodern_config.highlights) do
        vim.api.nvim_command(
            string.format(
                "highlight %s %s %s %s %s",
                group_name,
                replace_color("guifg", group_settings.fg),
                replace_color("guibg", group_settings.bg),
                replace_color("guisp", group_settings.sp),
                replace_color("gui", group_settings.fmt)
            )
        )
    end
    if config.favor_treesitter_hl then
        vim.highlight.priorities.semantic_tokens = 95
    end
end

return M

local c = require("neomodern.colors")
local config = vim.g.neomodern_config
local util = require("neomodern.util")

local M = {}

M.vim = {
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
    Macro = { fg = c.number, fmt = "italic" }, -- macros
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
    M.treesitter = {
        -- identifiers
        ["@variable"] = { fg = c.fg, fmt = config.code_style.variables }, -- any variable that does not have another higM.ght
        ["@variable.builtin"] = M.vim["Type"], -- variable names that are defined by the language, like 'this' or 'self'
        ["@variable.member"] = { fg = c.property }, -- fields
        ["@variable.parameter"] = { fg = c.alt }, -- parameters of a function
        -- ["@variable.field"] = { fg = c.property }, -- fields

        -- ["@constant"] = { link = "Constant" }, -- constants
        ["@constant.builtin"] = M.vim["Type"], -- constants that are defined by the language, like 'nil' in lua
        -- ["@constant.macro"] = { link = "Macro" }, -- constants that are defined by macros like 'NULL' in c

        -- ["@label"] = { link = "Label" }, -- labels
        ["@module"] = M.vim["Type"], -- modules and namespaces

        -- literals
        -- ["@string"] = { link = "String" }, -- strings
        ["@string.documentation"] = config.colored_docstrings and M.vim["String"] or M.vim["Comment"], -- doc strings
        ["@string.regexp"] = M.vim["SpecialChar"], -- regex
        ["@string.escape"] = M.vim["SpecialChar"], -- escape characters within string
        ["@string.special.symbol"] = M.vim["Identifier"],
        -- ["@string.special.url"] = { fg = c.func }, -- urls, links, emails

        -- ["@character"] = { link = "String" }, -- character literals
        -- ["@character.special"] = M.syntax["SpecialChar"], -- special characters

        -- ["@boolean"] = { link = "Constant" }, -- booleans
        -- ["@number"] = { link = "Number" }, -- all numbers
        -- ["@number.float"] = { link = "Number" }, -- floats

        -- types
        ["@type"] = M.vim["Type"], -- types
        -- ["@type.builtin"] = M.syntax["Type"], --builtin types
        -- ["@type.definition"] = M.syntax["Typedef"], -- typedefs
        -- ["@type.qualifier"]

        ["@attribute"] = M.vim["Function"], -- attributes, like <decorators> in python
        -- ["@property"] = { fg = c.property }, --same as TSField

        -- functions
        ["@function"] = M.vim["Function"], -- functions
        ["@function.builtin"] = M.vim["Function"], --builtin functions
        -- ["@function.macro"] = { link = "Macro" }, -- macro defined functions
        -- ["@function.call"]
        -- ["@function.method"]
        -- ["@function.method.call"]

        -- ["@constructor"] = { fg = c.constant, fmt = config.code_style.functions }, -- constructor calls and definitions
        ["@constructor.lua"] = { fg = config.colored_brackets and c.alt or c.fg, fmt = config.code_style.functions, }, -- constructor calls and definitions, `= { }` in lua
        ["@operator"] = M.vim["Operator"], -- operators, like `+`

        -- keywords
        ["@keyword"] = { fg = c.keyword, fmt = config.code_style.keywords }, -- keywords that don't fall in previous categories
        ["@keyword.exception"] = M.vim["Exception"], -- exception related keywords
        -- ["@keyword.import"] = M.syntax["PreProc"], -- keywords used to define a function
        ["@keyword.conditional"] = { fg = c.keyword, fmt = config.code_style.conditionals, }, -- keywords for conditional statements
        ["@keyword.operator"] = { fg = c.keyword, fmt = config.code_style.operators }, -- keyword operator (eg, 'in' in python)
        ["@keyword.return"] = { fg = c.keyword, fmt = config.code_style.keyword_return }, -- keywords used to define a function
        -- ["@keyword.function"] = M.syntax["Function"], -- keywords used to define a function
        -- ["@keyword.import"] = M.syntax["Include"], -- includes, like '#include' in c, 'require' in lua
        -- ["@keyword.storage"] = M.syntax["StorageClass"], -- visibility/life-time 'static'
        -- ["@keyword.repeat"] = M.syntax["Repeat"], -- for keywords related to loops

        -- punctuation
        ["@punctuation.delimiter"] = { fg = c.fg }, -- delimiters, like `; . , `
        ["@punctuation.bracket"] = { fg = config.colored_brackets and c.alt or c.fg }, -- brackets and parentheses
        ["@punctuation.special"] = M.vim["SpecialChar"], -- punctuation that does not fall into above categories, like `{}` in string interpolation

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
        ["@tag.attribute"] = M.vim["Identifier"], -- tags, like in html
        ["@tag.delimiter"] = { fg = c.fg }, -- tag delimiter < >
    }
    if vim.version()["minor"] > 0.9 then
        M.lsp = {
            ["@lsp.typemod.variable.global"] = { fg = util.darken(c.constant, 0.8, c.bg)},
            ["@lsp.typemod.keyword.documentation"] = { fg = util.darken(c.type, 0.8, c.bg)},
            ["@lsp.type.namespace"] = { fg = util.darken(c.constant, 0.8, c.bg)},
            ["@lsp.type.macro"] = M.vim["Macro"],
            ["@lsp.type.parameter"] = M.treesitter["@variable.parameter"],
            ["@lsp.type.lifetime"] = { fg = c.type, fmt = "italic" },
            ["@lsp.type.readonly"] = { fg = c.constant, fmt = "italic" },
            ["@lsp.mod.readonly"] = { fg = c.constant, fmt = "italic" },
            ["@lsp.mod.typeHint"] = M.vim["Type"],
        }
    end
end

local virtual_error = {
    bg = config.diagnostics.background and util.darken(c.diag_red, 0.1, c.bg) or c.none,
    fg = c.diag_red,
}

local virtual_warn = {
    bg = config.diagnostics.background and util.darken(c.diag_yellow, 0.1, c.bg)
        or c.none,
    fg = c.diag_yellow,
}

local virtual_info = {
    bg = config.diagnostics.background and util.darken(c.diag_blue, 0.1, c.bg)
        or c.none,
    fg = c.diag_blue,
}

local virtual_hint = {
    bg = config.diagnostics.background and util.darken(c.diag_blue, 0.1, c.bg)
        or c.none,
    fg = c.diag_blue,
}

M.diag = {
    DiagnosticError = { fg = c.diag_red },
    DiagnosticHint = { fg = c.diag_blue },
    DiagnosticInfo = { fg = c.diag_blue, fmt = "italic" },
    DiagnosticWarn = { fg = c.diag_yellow },

    DiagnosticVirtualTextError = virtual_error,
    DiagnosticVirtualTextWarn = virtual_warn,
    DiagnosticVirtualTextInfo = virtual_info,
    DiagnosticVirtualTextHint = virtual_hint,

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
M.diag.LspDiagnosticsDefaultError = M.diag.DiagnosticError
M.diag.LspDiagnosticsDefaultHint = M.diag.DiagnosticHint
M.diag.LspDiagnosticsDefaultInformation = M.diag.DiagnosticInfo
M.diag.LspDiagnosticsDefaultWarning = M.diag.DiagnosticWarn
M.diag.LspDiagnosticsUnderlineError = M.diag.DiagnosticUnderlineError
M.diag.LspDiagnosticsUnderlineHint = M.diag.DiagnosticUnderlineHint
M.diag.LspDiagnosticsUnderlineInformation = M.diag.DiagnosticUnderlineInfo
M.diag.LspDiagnosticsUnderlineWarning = M.diag.DiagnosticUnderlineWarn
M.diag.LspDiagnosticsVirtualTextError = M.diag.DiagnosticVirtualTextError
M.diag.LspDiagnosticsVirtualTextWarning = M.diag.DiagnosticVirtualTextWarn
M.diag.LspDiagnosticsVirtualTextInformation = M.diag.DiagnosticVirtualTextInfo
M.diag.LspDiagnosticsVirtualTextHint = M.diag.DiagnosticVirtualTextHint
-- stylua: ignore end

return M

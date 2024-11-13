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
  CursorLineNr = { fg = c.fg, bg = config.cursorline_gutter and c.line or c.none },
  CursorLineSign = { bg = config.cursorline_gutter and c.line or c.none },
  CursorLineFold = { fg = c.fg, bg = config.cursorline_gutter and c.line or c.none },
  Debug = { fg = c.operator },
  debugPC = { fg = c.error },
  debugBreakpoint = { fg = c.error },
  DiffAdd = { fg = c.plus },
  DiffChange = { fg = c.delta },
  DiffDelete = { fg = c.error },
  DiffText = { fg = c.fg },
  DiffAdded = { fg = c.plus },
  DiffRemoved = { fg = c.error },
  DiffFile = { fg = c.keyword },
  DiffIndexLine = { fg = c.comment },
  Directory = { fg = c.func },
  ErrorMsg = { fg = c.error, fmt = "bold" },
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
  PmenuSel = { fg = c.hint, bg = config.transparent and c.none or c.float },
  PmenuThumb = { bg = c.visual },
  Question = { fg = c.constant },
  QuickFixLine = { fg = c.func, fmt = "underline" },
  Search = { fg = c.hint, bg = c.visual },
  SignColumn = { fg = c.fg, bg = config.transparent and c.none or c.bg },
  SpecialKey = { fg = c.comment },
  SpellBad = { fg = c.none, fmt = "undercurl", sp = c.error },
  SpellCap = { fg = c.none, fmt = "undercurl", sp = c.warning },
  SpellLocal = { fg = c.none, fmt = "undercurl", sp = c.builtin },
  SpellRare = { fg = c.none, fmt = "undercurl", sp = c.hint },
  StatusLine = { fg = c.comment, bg = c.line },
  StatusLineTerm = { fg = c.comment, bg = c.line },
  StatusLineNC = { fg = c.comment, bg = c.line },
  StatusLineTermNC = { fg = c.comment, bg = c.line },
  Substitute = { fg = c.type, bg = c.visual },
  TabLine = { fg = c.comment, bg = c.line },
  TabLineFill = { fg = c.comment, bg = c.line },
  TabLineSel = { fg = c.hint, bg = c.visual },
  Terminal = { fg = c.fg, bg = config.transparent and c.none or c.bg },
  ToolbarButton = { fg = c.bg, bg = c.visual },
  ToolbarLine = { fg = c.fg },
  Visual = { fg = c.alt, bg = c.visual },
  VisualNOS = { fg = c.none, bg = c.comment, fmt = "underline" },
  WarningMsg = { fg = c.warning, fmt = "bold" },
  Whitespace = { fg = c.comment },
  WildMenu = { fg = c.hint, bg = util.darken(c.hint, 0.1, c.bg) },
  WinSeparator = { fg = c.comment },
}

hl.syntax = {
  Boolean = { fg = c.constant }, -- boolean constants
  Character = { fg = c.string }, -- character constants
  Comment = { fg = c.comment, fmt = config.code_style.comments }, -- comments
  Constant = { fg = c.constant, fmt = config.code_style.constants }, -- (preferred) any constant
  Delimiter = { fg = c.fg }, -- delimiter characters
  Float = { fg = c.constant }, -- float constants
  Function = { fg = c.func, fmt = config.code_style.functions }, -- functions
  Error = { fg = c.error }, -- (preferred) any erroneous construct
  Exception = { fg = c.error }, -- 'try', 'catch', 'throw'
  Identifier = { fg = c.property, fmt = config.code_style.variables }, -- (preferred) any variable
  Keyword = { fg = c.keyword, fmt = config.code_style.keywords }, -- any other keyword
  Conditional = { fg = c.keyword, fmt = config.code_style.conditionals }, -- conditionals
  -- Repeat = { fg = c.keyword, fmt = config.code_style.keywords }, -- loop keywords: 'for', 'while' etc
  -- Label = { fg = c.keyword }, -- 'case', 'default', etc
  Number = { fg = c.constant }, -- number constant
  Operator = { fg = c.operator, fmt = config.code_style.operators }, -- '+', '*', 'sizeof' etc
  PreProc = { fg = c.keyword }, -- (preferred) generic preprocessor
  -- Define = { fg = c.comment }, -- preprocessor '#define'
  -- Include = { fg = c.keyword, fmt = config.code_style.keywords }, -- preprocessor '#include'
  -- Macro = { fg = c.constant, fmt = config.code_style.constants }, -- macros
  -- PreCondit = { fg = c.comment }, -- preprocessor conditionals '#if', '#endif' etc
  Special = { fg = c.builtin }, -- (preferred) any special symbol
  SpecialChar = { fg = c.keyword }, -- special character in a constant
  -- SpecialComment = { fg = c.keyword, fmt = config.code_style.comments }, -- special things inside comments
  -- Tag = { fg = c.builtin }, -- can use <C-]> on this
  Statement = { fg = c.keyword }, -- (preferred) any statement
  String = { fg = c.string, fmt = config.code_style.strings }, -- string constants
  Title = { fg = c.keyword },
  Type = { fg = c.type }, -- (preferred) 'int', 'long', 'char' etc
  -- StorageClass = { fg = c.constant, fmt = config.code_style.keywords }, -- 'static', 'volatile' etc
  -- Structure = { fg = c.constant }, -- 'struct', 'union', 'enum' etc
  -- Typedef = { fg = c.constant }, -- 'typedef'
  Todo = { fg = c.func, fmt = config.code_style.comments }, -- (preferred) 'TODO' keywords in comments
}

-- stylua: ignore
if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
  hl.treesitter = {
    -- identifiers
    ["@variable"] = { fg = c.fg, fmt = config.code_style.variables }, -- any variable that does not have another highlight
    ["@variable.builtin"] = hl.syntax["Special"], -- variable names that are defined by the language, like 'this' or 'self'
    ["@variable.member"] = { fg = c.property }, -- fields
    -- ["@variable.parameter"] = { fg = c.property }, -- parameters of a function
    -- ["@variable.field"] = { fg = c.builtin }, -- fields

    -- ["@constant"] = { link = "Constant" }, -- constants
    ["@constant.builtin"] = hl.syntax["Special"], -- constants that are defined by the language, like 'nil' in lua
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
    -- ["@type"] = hl.syntax["Type"], -- types
    -- ["@type.builtin"] = hl.syntax["Special"], --builtin types
    -- ["@type.definition"] = hl.syntax["Typedef"], -- typedefs
    -- ["@type.qualifier"]

    ["@attribute"] = hl.syntax["Special"], -- attributes, like <decorators> in python
    -- ["@property"] = { fg = c.property }, --same as TSField

    -- functions
    -- ["@function"] = { link = "Function" }, -- functions
    ["@function.builtin"] = hl.syntax["Special"], --builtin functions
    -- ["@function.macro"] = { link = "Macro" }, -- macro defined functions
    -- ["@function.call"]
    -- ["@function.method"]
    -- ["@function.method.call"]

    ["@constructor"] = { fg = c.constant, fmt = config.code_style.functions }, -- constructor calls and definitions
    ["@constructor.lua"] = { fg = config.colored_brackets and c.alt or c.fg, fmt = config.code_style.functions }, -- constructor calls and definitions, `= { }` in lua
    ["@operator"] = hl.syntax["Operator"], -- operators, like `+`

    -- keywords
    ["@keyword"] = { fg = c.keyword, fmt = config.code_style.keywords }, -- keywords that don't fall in previous categories
    ["@keyword.exception"] = hl.syntax["Exception"], -- exception related keywords
    ["@keyword.import"] = hl.syntax["PreProc"], -- keywords used to define a function
    ["@keyword.conditional"] = { fg = c.keyword, fmt = config.code_style.conditionals }, -- keywords for conditional statements
    ["@keyword.operator"] = { fg = c.keyword, fmt = config.code_style.operators }, -- keyword operator (eg, 'in' in python)
    ["@keyword.return"] = { fg = c.keyword, fmt = config.code_style.keyword_return }, -- keywords used to define a function
    -- ["@keyword.builtin"] = hl.syntax["Type"], -- keywords used to define a function
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
    -- ["@comment.error"]
    -- ["@comment.warning"]
    -- ["@comment.note"]

    -- markup
    ["@markup"] = { fg = c.fg }, -- text in markup language
    ["@markup.strong"] = { fg = c.fg, fmt = "bold" }, -- bold
    ["@markup.italic"] = { fg = c.fg, fmt = "italic" }, -- italic
    ["@markup.underline"] = { fg = c.fg, fmt = "underline" }, -- underline
    ["@markup.strikethrough"] = { fg = c.comment, fmt = "strikethrough" }, -- strikethrough
    ["@markup.heading"] = { fg = c.keyword, fmt = config.code_style.headings}, -- markdown titles
    ["@markup.quote.markdown"] = { fg = c.comment }, -- quotes with >
    ["@markup.link.uri"] = { fg = c.alt, fmt = "underline" }, -- urls, links, emails
    ["@markup.link"] = { fg = c.builtin }, -- text references, footnotes, citations, etc
    ["@markup.list"] = { fg = c.func },
    ["@markup.list.checked"] = { fg = c.func }, -- todo checked
    ["@markup.list.unchecked"] = { fg = c.func }, -- todo unchecked
    ["@markup.raw"] = { fg = c.func }, -- inline code in markdown
    ["@markup.math"] = { fg = c.builtin }, -- math environments, like `$$` in latex

    -- diff
    ["@diff.plus"] = { fg = c.plus }, -- added text (diff files)
    ["@diff.minus"] = { fg = c.error }, -- removed text (diff files)
    ["@diff.delta"] = { fg = c.delta }, -- changed text (diff files)

    -- tags
    -- ["@tag"]
    ["@tag.attribute"] = hl.syntax["Identifier"], -- tags, like in html
    ["@tag.delimiter"] = { fg = c.fg }, -- tag delimiter < >
  }
  if vim.api.nvim_call_function("has", { "nvim-0.9" }) == 1 then
    hl.lsp = {
      -- ["@lsp.type.class"] = { link = "Structure" },
      ["@lsp.type.comment"] = hl.syntax["Comment"],
      -- ["@lsp.type.enum"] = { link = "Structure" },
      -- ["@lsp.type.enumMember"] = { link = "Constant" },
      -- ["@lsp.type.interface"] = { link = "Structure" },
      -- ["@lsp.type.typeParameter"] = { link = "Typedef" },
      ["@lsp.type.namespace"] = hl.treesitter["@module"],
      ["@lsp.type.parameter"] = hl.treesitter["@variable.parameter"],
      -- ["@lsp.type.property"] = { link = "Identifier" },
      -- ["@lsp.type.variable"] = hl.treesitter["@variable"],
      -- ["@lsp.type.macro"] = { link = "Macro" },
      -- ["@lsp.type.method"] = { link = "@function.method" },
      -- ["@lsp.type.generic"] = { link = "Type" },
      -- ["@lsp.type.builtinType"] = { link = "Special" },
      ["@lsp.type.selfParameter"] = hl.syntax["Special"],
      ["@lsp.type.builtinConstant"] = hl.syntax["Special"],
      ["@lsp.typemod.method.defaultLibrary"] = hl.syntax["Special"],
      ["@lsp.typemod.function.defaultLibrary"] = hl.syntax["Special"],
      ["@lsp.typemod.function.builtin"] = hl.syntax["Special"],
      ["@lsp.typemod.operator.injected"] = hl.syntax["Operator"],
      ["@lsp.typemod.string.injected"] = hl.syntax["String"],
      ["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
      ["@lsp.typemod.variable.defaultLibrary"] = hl.syntax["Special"],
      ["@lsp.typemod.variable.static"] = hl.syntax["Constant"],
      ["@lsp.typemod.variable.global"] = hl.syntax["Constant"],
      ["@lsp.typemod.operator.controlFlow"] = hl.treesitter["@keyword.exception"],
      ["@lsp.typemod.keyword.documentation"] = hl.syntax["Special"],
      ["@lsp.mod.readonly"] = hl.syntax["Constant"],
      ["@lsp.mod.typeHint"] = hl.syntax["Type"],
    }
  end
end

local diagnostics_error_color = c.error
local diagnostics_hint_color = c.hint
local diagnostics_warn_color = c.warning
local diagnostics_info_color = c.delta

hl.plugins.lsp = {
  DiagnosticError = { fg = c.error },
  DiagnosticHint = { fg = c.hint },
  DiagnosticInfo = { fg = c.delta, fmt = "italic" },
  DiagnosticWarn = { fg = c.warning },

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
    sp = c.error,
  },
  DiagnosticUnderlineHint = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.hint,
  },
  DiagnosticUnderlineInfo = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.delta,
  },
  DiagnosticUnderlineWarn = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.warning,
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
  DiffviewStatusUntracked = { fg = c.delta },
  DiffviewStatusModified = { fg = c.delta },
  DiffviewStatusRenamed = { fg = c.delta },
  DiffviewStatusCopied = { fg = c.delta },
  DiffviewStatusTypeChange = { fg = c.delta },
  DiffviewStatusUnmerged = { fg = c.delta },
  DiffviewStatusUnknown = { fg = c.error },
  DiffviewStatusDeleted = { fg = c.error },
  DiffviewStatusBroken = { fg = c.error },
}

hl.plugins.gitsigns = {
  GitSignsAdd = { fg = c.plus },
  GitSignsAddLn = { fg = c.plus },
  GitSignsAddNr = { fg = c.plus },
  GitSignsAddCul = { fg = c.plus, bg = c.line },
  GitSignsChange = { fg = c.delta },
  GitSignsChangeLn = { fg = c.delta },
  GitSignsChangeNr = { fg = c.delta },
  GitSignsChangeCul = { fg = c.delta, bg = c.line },
  GitSignsDelete = { fg = c.error },
  GitSignsDeleteLn = { fg = c.error },
  GitSignsDeleteNr = { fg = c.error },
  GitSignsDeleteCul = { fg = c.error, bg = c.line },
}

hl.plugins.neo_tree = {
  NeoTreeNormal = { fg = c.fg, bg = config.transparent and c.none or c.bg },
  NeoTreeNormalNC = { fg = c.fg, bg = config.transparent and c.none or c.bg },
  NeoTreeVertSplit = { fg = c.comment, bg = config.transparent and c.none or c.comment },
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
  NeoTreeGitDeleted = { fg = c.error },
  NeoTreeGitModified = { fg = c.delta },
  NeoTreeGitConflict = { fg = c.error, fmt = "bold,italic" },
  NeoTreeGitUntracked = { fg = c.error, fmt = "italic" },
  NeoTreeIndentMarker = { fg = c.comment },
  NeoTreeSymbolicLinkTarget = { fg = c.hint },
}

hl.plugins.nvim_tree = {
  NvimTreeNormal = { fg = c.fg, bg = config.transparent and c.none or c.bg },
  NvimTreeVertSplit = { fg = c.float, bg = config.transparent and c.none or c.bg },
  NvimTreeEndOfBuffer = {
    fg = config.show_eob and c.comment or c.bg,
    bg = config.transparent and c.none or c.bg,
  },
  NvimTreeRootFolder = { fg = c.type, fmt = "bold" },
  NvimTreeGitDirty = { fg = c.delta },
  NvimTreeGitNew = { fg = c.fg },
  NvimTreeGitDeleted = { fg = c.error },
  NvimTreeSpecialFile = { fg = c.warning, fmt = "underline" },
  NvimTreeIndentMarker = { fg = c.fg },
  NvimTreeImageFile = { fg = c.visual },
  NvimTreeSymlink = { fg = c.hint },
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
    TelescopeSelection = { fg = c.hint, bg = config.transparent and c.none or c.float },
    TelescopeSelectionCaret = { fg = c.hint },
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
  Null = c.builtin,
  Number = c.func,
  Object = c.type,
  Operator = c.operator,
  Package = c.constant,
  Property = c.property,
  Reference = c.builtin,
  Snippet = c.builtin,
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
end

return M

local c = require("neomodern.colors")
local config = vim.g.neomodern_config
local util = require("neomodern.util")

local M = {}
local hl = { plugins = {} }

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

hl.common = {
  ColorColumn = { bg = c.line },
  Conceal = { fg = c.comment, bg = c.line },
  CurSearch = { fg = c.type, bg = c.comment },
  Cursor = { fmt = "reverse" },
  vCursor = { fmt = "reverse" },
  iCursor = { fmt = "reverse" },
  lCursor = { fmt = "reverse" },
  CursorIM = { fmt = "reverse" },
  CursorColumn = { bg = c.line },
  CursorLine = { bg = c.line },
  CursorLineNr = { fg = c.fg },
  Debug = { fg = c.constant },
  debugPC = { fg = c.bg, bg = c.fg },
  debugBreakpoint = { fg = c.bg, bg = c.operator },
  DiffAdd = { fg = c.none, bg = c.diff_add },
  DiffChange = { fg = c.none, bg = c.diff_change },
  DiffDelete = { fg = c.none, bg = c.diff_delete },
  DiffText = { fg = c.none, bg = c.diff_text },
  DiffAdded = { fg = c.fg },
  DiffRemoved = { fg = c.operator },
  DiffFile = { fg = c.keyword },
  DiffIndexLine = { fg = c.comment },
  Directory = { fg = c.func },
  ErrorMsg = { fg = c.operator, fmt = "bold" },
  EndOfBuffer = { fg = config.show_eob and c.comment or c.bg },
  FloatBorder = { fg = c.comment, bg = config.transparent and c.none or c.bg },
  FloatTitle = { fg = c.comment, bg = c.float },
  Folded = { fg = c.comment, bg = config.transparent and c.none or c.line },
  FoldColumn = { fg = c.comment, bg = config.transparent and c.none or c.bg },
  IncSearch = { fg = c.type, bg = c.visual },
  LineNr = { fg = c.comment },
  MatchParen = { fg = c.bg, bg = c.type },
  MoreMsg = { fg = c.func, fmt = "bold" },
  MsgSeparator = { fg = c.string, bg = c.line, fmt = "bold" },
  NonText = { fg = c.comment },
  Normal = { fg = c.fg, bg = config.transparent and c.none or c.bg },
  NormalFloat = { fg = c.fg, bg = config.transparent and c.none or c.float },
  -- TODO: pmenu
  Pmenu = { fg = c.fg, bg = c.menu },
  PmenuSbar = { fg = c.none, bg = c.menu },
  PmenuSel = { fg = c.type },
  PmenuThumb = { fg = c.none, bg = c.menu },
  Question = { fg = c.constant },
  QuickFixLine = { fg = c.func, fmt = "underline" },
  Search = { fg = "#aaaaaa", bg = c.visual },
  SignColumn = { fg = c.fg, bg = config.transparent and c.none or c.bg },
  SpecialKey = { fg = c.comment },
  SpellBad = { fg = c.none, fmt = "undercurl", sp = c.operator },
  SpellCap = { fg = c.none, fmt = "undercurl", sp = c.constant },
  SpellLocal = { fg = c.none, fmt = "undercurl", sp = c.builtin },
  SpellRare = { fg = c.none, fmt = "undercurl", sp = c.conditional },
  StatusLine = { fg = c.fg, bg = c.comment },
  StatusLineTerm = { fg = c.fg, bg = c.line },
  StatusLineNC = { fg = c.comment, bg = c.c3 },
  StatusLineTermNC = { fg = c.comment, bg = c.line },
  Substitute = { fg = c.bg, bg = c.fg },
  TabLine = { fg = c.fg, bg = c.line },
  TabLineFill = { fg = c.comment, bg = c.line },
  TabLineSel = { fg = c.bg, bg = c.fg },
  Terminal = { fg = c.fg, bg = config.transparent and c.none or c.bg },
  ToolbarButton = { fg = c.bg, bg = c.visual },
  ToolbarLine = { fg = c.fg },
  Visual = { bg = c.visual },
  VisualNOS = { fg = c.none, bg = c.comment, fmt = "underline" },
  WarningMsg = { fg = c.type, fmt = "bold" },
  Whitespace = { fg = c.comment },
  WildMenu = { fg = c.bg, bg = c.func },
  WinSeparator = { fg = c.border },
}

hl.syntax = {
  Boolean = { fg = c.constant }, -- boolean constants
  Character = { fg = c.string }, -- character constants
  Comment = { fg = c.comment, fmt = config.code_style.comments }, -- comments
  Constant = { fg = c.constant, fmt = config.code_style.constants }, -- (preferred) any constant
  Delimiter = { fg = c.fg }, -- delimiter characters
  Float = { fg = c.func }, -- float constants
  Function = { fg = c.func, fmt = config.code_style.functions }, -- functions
  Error = { fg = c.operator }, -- (preferred) any erroneous construct
  Exception = { fg = c.conditional }, -- 'try', 'catch', 'throw'
  Identifier = { fg = c.property, fmt = config.code_style.variables }, -- (preferred) any variable
  Keyword = { fg = c.keyword, fmt = config.code_style.keywords }, -- any other keyword
  -- Conditional = { fg = c.conditional, fmt = config.code_style.keywords }, -- conditionals
  -- Repeat = { fg = c.conditional, fmt = config.code_style.keywords }, -- loop keywords: 'for', 'while' etc
  -- Label = { fg = c.conditional }, -- 'case', 'default', etc
  Number = { fg = c.func }, -- number constant
  Operator = { fg = c.operator }, -- '+', '*', 'sizeof' etc
  PreProc = { fg = c.conditional }, -- (preferred) generic preprocessor
  -- Define = { fg = c.comment }, -- preprocessor '#define'
  -- Include = { fg = c.keyword, fmt = config.code_style.keywords }, -- preprocessor '#include'
  -- Macro = { fg = c.constant, fmt = config.code_style.constants }, -- macros
  -- PreCondit = { fg = c.comment }, -- preprocessor conditionals '#if', '#endif' etc
  Special = { fg = c.builtin }, -- (preferred) any special symbol
  -- SpecialChar = { fg = c.param }, -- special character in a constant
  -- SpecialComment = { fg = c.param, fmt = config.code_style.comments }, -- special things inside comments
  -- Tag = { fg = c.builtin }, -- can use <C-]> on this
  Statement = { fg = c.param }, -- (preferred) any statement
  String = { fg = c.string, fmt = config.code_style.strings }, -- string constants
  Title = { fg = c.property },
  Type = { fg = c.type }, -- (preferred) 'int', 'long', 'char' etc
  -- StorageClass = { fg = c.constant, fmt = config.code_style.keywords }, -- 'static', 'volatile' etc
  -- Structure = { fg = c.constant }, -- 'struct', 'union', 'enum' etc
  -- Typedef = { fg = c.constant }, -- 'typedef'
  Todo = { fg = c.func, fmt = config.code_style.comments }, -- (preferred) 'TODO' keywords in comments
}

if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
  hl.treesitter = {
    -- identifiers
    ["@variable"] = { fg = c.fg }, -- any variable that does not have another highlight
    ["@variable.builtin"] = hl.syntax["Special"], -- variable names that are defined by the language, like 'this' or 'self'
    ["@variable.member"] = { fg = c.property }, -- fields
    -- ["@variable.parameter"] = { fg = c.param }, -- parameters of a function
    -- ["@variable.field"] = { fg = c.builtin }, -- fields

    -- ["@constant"] = { link = "Constant" }, -- constants
    ["@constant.builtin"] = hl.syntax["Special"], -- constants that are defined by the language, like 'nil' in lua
    -- ["@constant.macro"] = { link = "Macro" }, -- constants that are defined by macros like 'NULL' in c

    -- ["@label"] = { link = "Label" }, -- labels
    ["@module"] = { link = "Type" }, -- modules and namespaces

    -- literals
    -- ["@string"] = { link = "String" }, -- strings
    ["@string.documentation"] = hl.syntax["Comment"], -- doc strings
    ["@string.regexp"] = hl.syntax["SpecialChar"], -- regex
    ["@string.escape"] = hl.syntax["SpecialChar"], -- escape characters within string
    ["@string.special.symbol"] = hl.syntax["Identifie"],
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

    ["@attribute"] = hl.syntax["Constant"], -- attributes, like <decorators> in python
    -- ["@property"] = { fg = c.property }, --same as TSField

    -- functions
    -- ["@function"] = { link = "Function" }, -- functions
    ["@function.builtin"] = hl.syntax["Special"], --builtin functions
    -- ["@function.macro"] = { link = "Macro" }, -- macro defined functions
    -- ["@function.call"]
    -- ["@function.method"]
    -- ["@function.method.call"]

    ["@constructor"] = { fg = c.constant, fmt = config.code_style.functions }, -- constructor calls and definitions, `= { }` in lua
    ["@operator"] = hl.syntax["Operator"], -- operators, like `+`

    -- keywords
    -- ["@keyword"] = { link = "Keyword" }, -- keywords that don't fall in previous categories
    ["@keyword.import"] = hl.syntax["PreProc"], -- keywords used to define a function
    ["@keyword.return"] = { fg = c.conditional, fmt = "italic" }, -- keywords used to define a function
    -- ["@keyword.builtin"] = hl.syntax["Type"], -- keywords used to define a function
    ["@keyword.operator"] = { fg = c.operator }, -- keyword operator (eg, 'in' in python)
    ["@keyword.exception"] = hl.syntax["Exceptio"], -- exception related keywords
    -- ["@keyword.function"] = hl.syntax["Function"], -- keywords used to define a function
    -- ["@keyword.conditional"] = hl.syntax["Conditional"], -- keywords for conditional statements
    -- ["@keyword.import"] = hl.syntax["Include"], -- includes, like '#include' in c, 'require' in lua
    -- ["@keyword.storage"] = hl.syntax["StorageClass"], -- visibility/life-time 'static'
    -- ["@keyword.repeat"] = hl.syntax["Repeat"], -- for keywords related to loops

    -- punctuation
    ["@punctuation.delimiter"] = { fg = c.fg }, -- delimiters, like `; . , `
    ["@punctuation.bracket"] = { fg = c.fg }, -- brackets and parentheses
    ["@punctuation.special"] = { fg = c.fg }, -- punctuation that does not fall into above categories, like `{}` in string interpolation

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
    ["@markup.heading"] = { fg = c.keyword, fmt = "bold" }, -- markdown titles
    ["@markup.quote.markdown"] = { fg = c.comment }, -- quotes with >
    ["@markup.link.uri"] = { fg = c.param, fmt = "underline" }, -- urls, links, emails
    ["@markup.link"] = { fg = c.builtin }, -- text references, footnotes, citations, etc
    ["@markup.list"] = { fg = c.property },
    ["@markup.list.checked"] = { fg = c.func }, -- todo checked
    ["@markup.list.unchecked"] = { fg = c.param }, -- todo unchecked
    ["@markup.raw"] = { fg = c.func }, -- inline code in markdown, python doc `"""`
    ["@markup.math"] = { fg = c.operator }, -- math environments, like `$$` in latex

    -- diff
    ["@diff.plus"] = { fg = c.string }, -- added text (diff files)
    ["@diff.minus"] = { fg = c.operator }, -- removed text (diff files)
    ["@diff.delta"] = { fg = c.func }, -- changed text (diff files)

    -- tags
    -- ["@tag"]
    ["@tag.attribute"] = hl.syntax["Identifie"], -- tags, like in html
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
      ["@lsp.type.variable"] = hl.treesitter["@variable"],
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

local diagnostics_error_color = config.diagnostics.darker and c.error or c.operator
local diagnostics_hint_color = config.diagnostics.darker and c.hint or c.conditional
local diagnostics_warn_color = config.diagnostics.darker and c.warning or c.constant
local diagnostics_info_color = config.diagnostics.darker and c.func or c.param

hl.plugins.lsp = {
  LspCxxHlGroupEnumConstant = { fg = c.type },
  LspCxxHlGroupMemberVariable = { fg = c.type },
  LspCxxHlGroupNamespace = { fg = c.func },
  LspCxxHlSkippedRegion = { fg = c.comment },
  LspCxxHlSkippedRegionBeginEnd = { fg = c.operator },

  DiagnosticError = { fg = c.operator },
  DiagnosticHint = { fg = c.conditional },
  DiagnosticInfo = { fg = c.param, fmt = "italic" },
  DiagnosticWarn = { fg = c.constant },

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
    sp = c.operator,
  },
  DiagnosticUnderlineHint = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.conditional,
  },
  DiagnosticUnderlineInfo = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.func,
  },
  DiagnosticUnderlineWarn = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.constant,
  },

  LspReferenceText = { bg = c.comment },
  LspReferenceWrite = { bg = c.comment },
  LspReferenceRead = { bg = c.comment },

  LspCodeLens = { fg = c.comment, fmt = config.code_style.comments },
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

hl.plugins.cmp = {
  CmpItemAbbr = { fg = c.fg },
  CmpItemAbbrDeprecated = { fg = c.comment, fmt = "strikethrough" },
  CmpItemAbbrMatch = { fg = c.keyword },
  CmpItemAbbrMatchFuzzy = { fg = c.keyword, fmt = "underline" },
  CmpItemMenu = { fg = c.comment },
  CmpItemKind = { fg = c.fg, fmt = config.cmp_itemkind_reverse and "reverse" },
}

hl.plugins.diffview = {
  DiffviewFilePanelTitle = { fg = c.func, fmt = "bold" },
  DiffviewFilePanelCounter = { fg = c.conditional, fmt = "bold" },
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
  DiffviewStatusUntracked = { fg = c.func },
  DiffviewStatusModified = { fg = c.func },
  DiffviewStatusRenamed = { fg = c.func },
  DiffviewStatusCopied = { fg = c.func },
  DiffviewStatusTypeChange = { fg = c.func },
  DiffviewStatusUnmerged = { fg = c.func },
  DiffviewStatusUnknown = { fg = c.operator },
  DiffviewStatusDeleted = { fg = c.operator },
  DiffviewStatusBroken = { fg = c.operator },
}

hl.plugins.gitsigns = {
  GitSignsAdd = { fg = c.property },
  GitSignsAddLn = { fg = c.property },
  GitSignsAddNr = { fg = c.property },
  GitSignsChange = { fg = c.func },
  GitSignsChangeLn = { fg = c.func },
  GitSignsChangeNr = { fg = c.func },
  GitSignsDelete = { fg = c.operator },
  GitSignsDeleteLn = { fg = c.operator },
  GitSignsDeleteNr = { fg = c.operator },
}

hl.plugins.neo_tree = {
  NeoTreeNormal = { fg = c.fg, bg = config.transparent and c.none or c.float },
  NeoTreeNormalNC = { fg = c.fg, bg = config.transparent and c.none or c.float },
  NeoTreeVertSplit = { fg = c.comment, bg = config.transparent and c.none or c.comment },
  NeoTreeWinSeparator = {
    fg = c.comment,
    bg = config.transparent and c.none or c.comment,
  },
  NeoTreeEndOfBuffer = {
    fg = config.show_eob and c.comment or c.float,
    bg = config.transparent and c.none or c.float,
  },
  NeoTreeRootName = { fg = c.type, fmt = "bold" },
  NeoTreeGitAdded = { fg = c.fg },
  NeoTreeGitDeleted = { fg = c.operator },
  NeoTreeGitModified = { fg = c.constant },
  NeoTreeGitConflict = { fg = c.operator, fmt = "bold,italic" },
  NeoTreeGitUntracked = { fg = c.operator, fmt = "italic" },
  NeoTreeIndentMarker = { fg = c.comment },
  NeoTreeSymbolicLinkTarget = { fg = c.conditional },
}

hl.plugins.nvim_tree = {
  NvimTreeNormal = { fg = c.fg, bg = config.transparent and c.none or c.float },
  NvimTreeVertSplit = { fg = c.float, bg = config.transparent and c.none or c.float },
  NvimTreeEndOfBuffer = {
    fg = config.show_eob and c.comment or c.float,
    bg = config.transparent and c.none or c.float,
  },
  NvimTreeRootFolder = { fg = c.type, fmt = "bold" },
  NvimTreeGitDirty = { fg = c.constant },
  NvimTreeGitNew = { fg = c.fg },
  NvimTreeGitDeleted = { fg = c.operator },
  NvimTreeSpecialFile = { fg = c.constant, fmt = "underline" },
  NvimTreeIndentMarker = { fg = c.fg },
  -- TODO:
  -- NvimTreeImageFile = { fg = c.dark_10 },
  NvimTreeSymlink = { fg = c.conditional },
  NvimTreeFolderName = { fg = c.func },
}

hl.plugins.telescope = {
  TelescopeBorder = { fg = c.border },
  TelescopeMatching = { fg = c.type, fmt = "bold" },
  TelescopePromptPrefix = { fg = c.property },
  TelescopeSelection = { fg = c.type, bg = c.bg },
  TelescopeSelectionCaret = { fg = c.type },
  TelescopeResultsNormal = { fg = c.fg },
}

hl.plugins.dashboard = {
  DashboardShortCut = { fg = c.func },
  DashboardHeader = { fg = c.func },
  DashboardCenter = { fg = c.fg },
  DashboardFooter = { fg = c.conditional, fmt = "italic" },
}

hl.plugins.indent_blankline = {
  IndentBlanklineIndent1 = { fg = c.func },
  IndentBlanklineIndent2 = { fg = c.fg },
  IndentBlanklineIndent3 = { fg = c.keyword },
  IndentBlanklineIndent4 = { fg = c.comment },
  IndentBlanklineIndent5 = { fg = c.conditional },
  IndentBlanklineIndent6 = { fg = c.operator },
  IndentBlanklineChar = { fg = c.comment, fmt = "nocombine" },
  IndentBlanklineContextChar = { fg = c.comment, fmt = "nocombine" },
  IndentBlanklineContextStart = { sp = c.comment, fmt = "underline" },
  IndentBlanklineContextSpaceChar = { fmt = "nocombine" },

  -- Ibl v3
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
  File = c.string,
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
  Reference = c.param,
  Snippet = c.param,
  String = c.string,
  Struct = c.keyword,
  Text = c.fg,
  TypeParameter = c.param,
  Unit = c.fg,
  Value = c.fg,
  Variable = c.fg,
}

-- TODO: notify of nvim 0.8 requirement
function M.setup()
  --
  -- define cmp and aerial kind highlights with lsp_kind_icons_color
  for kind, color in pairs(lsp_kind_icons_color) do
    hl.plugins.cmp["CmpItemKind" .. kind] =
      { fg = color, fmt = config.cmp_itemkind_reverse and "reverse" }
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

  -- user defined highlights: vim_highlights function cannot be used because it sets an attribute to none if not specified
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

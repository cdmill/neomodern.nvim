local c = require("saguaro.colors")
local config = vim.g.saguaro_config
local util = require("saguaro.util")

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
  Conceal = { fg = c.c5, bg = c.c4 },
  CurSearch = { fg = c.c16, bg = c.c5 },
  Cursor = { fmt = "reverse" },
  vCursor = { fmt = "reverse" },
  iCursor = { fmt = "reverse" },
  lCursor = { fmt = "reverse" },
  CursorIM = { fmt = "reverse" },
  CursorColumn = { bg = c.line },
  CursorLine = { bg = c.line },
  CursorLineNr = { fg = c.c2 },
  Debug = { fg = c.c17 },
  debugPC = { fg = c.bg, bg = c.c7 },
  debugBreakpoint = { fg = c.bg, bg = c.c9 },
  DiffAdd = { fg = c.none, bg = c.diff_add },
  DiffChange = { fg = c.none, bg = c.diff_change },
  DiffDelete = { fg = c.none, bg = c.diff_delete },
  DiffText = { fg = c.none, bg = c.diff_text },
  DiffAdded = { fg = c.c7 },
  DiffRemoved = { fg = c.c9 },
  DiffFile = { fg = c.c15 },
  DiffIndexLine = { fg = c.c5 },
  Directory = { fg = c.c1 },
  ErrorMsg = { fg = c.c9, fmt = "bold" },
  EndOfBuffer = { fg = config.show_eob and c.c4 or c.bg },
  FloatBorder = { fg = c.c5, bg = config.transparent and c.none or c.line },
  FloatTitle = { fg = c.c5, bg = c.float },
  Folded = { fg = c.c6, bg = config.transparent and c.none or c.line },
  FoldColumn = { fg = c.c6, bg = config.transparent and c.none or c.bg },
  IncSearch = { fg = c.c16, bg = c.c5 },
  LineNr = { fg = c.c5 },
  MatchParen = { fg = c.bg, bg = c.c16 },
  MoreMsg = { fg = c.c11, fmt = "bold" },
  MsgSeparator = { fg = c.c1, bg = c.line, fmt = "bold" },
  NonText = { fg = c.c5 },
  Normal = { fg = c.c7, bg = config.transparent and c.none or c.bg },
  NormalFloat = { fg = c.c7, bg = config.transparent and c.none or c.float },
  Pmenu = { fg = c.c7, bg = c.c20 },
  PmenuSbar = { fg = c.none, bg = c.c20 },
  PmenuSel = { fg = c.c16 },
  PmenuThumb = { fg = c.none, bg = c.c20 },
  Question = { fg = c.c17 },
  QuickFixLine = { fg = c.c11, fmt = "underline" },
  Search = { fg = c.c11, bg = c.c5 },
  SignColumn = { fg = c.c7, bg = config.transparent and c.none or c.bg },
  SpecialKey = { fg = c.c5 },
  SpellBad = { fg = c.none, fmt = "undercurl", sp = c.c9 },
  SpellCap = { fg = c.none, fmt = "undercurl", sp = c.c17 },
  SpellLocal = { fg = c.none, fmt = "undercurl", sp = c.c12 },
  SpellRare = { fg = c.none, fmt = "undercurl", sp = c.c14 },
  StatusLine = { fg = c.c7, bg = c.c4 },
  StatusLineTerm = { fg = c.c7, bg = c.line },
  StatusLineNC = { fg = c.c5, bg = c.c4 },
  StatusLineTermNC = { fg = c.c5, bg = c.line },
  Substitute = { fg = c.bg, bg = c.c7 },
  TabLine = { fg = c.c7, bg = c.line },
  TabLineFill = { fg = c.c5, bg = c.line },
  TabLineSel = { fg = c.bg, bg = c.c7 },
  Terminal = { fg = c.c7, bg = config.transparent and c.none or c.bg },
  ToolbarButton = { fg = c.bg, bg = c.c18 },
  ToolbarLine = { fg = c.c7 },
  Visual = { bg = c.c18 },
  VisualNOS = { fg = c.none, bg = c.c4, fmt = "underline" },
  WarningMsg = { fg = c.c16, fmt = "bold" },
  Whitespace = { fg = c.c5 },
  WildMenu = { fg = c.bg, bg = c.c11 },
  WinSeparator = { fg = c.border },
}

hl.syntax = {
  Boolean = { fg = c.c12 }, -- boolean constants
  Character = { fg = c.c16 }, -- character constants
  Comment = { fg = c.c5, fmt = config.code_style.comments }, -- comments
  Conditional = { fg = c.c13, fmt = config.code_style.keywords }, -- conditionals
  Constant = { fg = c.c16, fmt = config.code_style.constants }, -- (preferred) any constant
  Define = { fg = c.c6 }, -- preprocessor '#define'
  Delimiter = { fg = c.c6 }, -- delimiter characters
  Float = { fg = c.c9 }, -- float constants
  Function = { fg = c.c11, fmt = config.code_style.functions }, -- functions
  Error = { fg = c.c9 }, -- (preferred) any erroneous construct
  Exception = { fg = c.c13 }, -- 'try', 'catch', 'throw'
  Identifier = { fg = c.c10, fmt = config.code_style.variables }, -- (preferred) any variable
  Include = { fg = c.c13, fmt = config.code_style.keywords }, -- preprocessor '#include'
  Keyword = { fg = c.c2, fmt = config.code_style.keywords }, -- any other keyword
  Label = { fg = c.c12 }, -- 'case', 'default', etc
  Macro = { fg = c.c16, fmt = config.code_style.constants }, -- macros
  Number = { fg = c.c9 }, -- number constant
  Operator = { fg = c.c7 }, -- '+', '*', 'sizeof' etc
  PreProc = { fg = c.c6 }, -- (preferred) generic preprocessor
  PreCondit = { fg = c.c6 }, -- preprocessor conditionals '#if', '#endif' etc
  Repeat = { fg = c.c13, fmt = config.code_style.keywords }, -- loop keywords: 'for', 'while' etc
  Special = { fg = c.c12 }, -- (preferred) any special symbol
  SpecialChar = { fg = c.c16 }, -- special character in a constant
  SpecialComment = { fg = c.c16, fmt = config.code_style.comments }, -- special things inside comments
  Statement = { fg = c.c2 }, -- (preferred) any statement
  StorageClass = { fg = c.c13, fmt = config.code_style.keywords }, -- 'static', 'volatile' etc
  String = { fg = c.c14, fmt = config.code_style.strings }, -- string constants
  Structure = { fg = c.c13 }, -- 'struct', 'union', 'enum' etc
  Tag = { fg = c.c17 }, -- can use <C-}> on this
  Title = { fg = c.c0 },
  Type = { fg = c.c16 }, -- (preferred) 'int', 'long', 'char' etc
  Typedef = { fg = c.c17 }, -- 'typedef'
  Todo = { fg = c.c11, fmt = config.code_style.comments }, -- (preferred) 'TODO' keywords in comments
}

if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
  hl.treesitter = {
    -- identifiers
    ["@variable"] = hl.syntax["Identifier"], -- any variable that does not have another highlight
    ["@variable.builtin"] = hl.syntax["Label"], -- variable names that are defined by the language, like 'this' or 'self'
    ["@variable.parameter"] = { fg = c.c0 }, -- parameters of a function
    -- ["@variable.field"] = { fg = c.c12 }, -- fields
    -- ["@variable.member"] = { fg = c.c0 }, -- fields

    ["@constant"] = hl.syntax["Constant"], -- constants
    -- ["@constant.builtin"] = hl.syntax["Constant"], -- constants that are defined by the language, like 'nil' in lua
    -- ["@constant.macro"] = hl.syntax["Macro"], -- constants that are defined by macros like 'NULL' in c

    ["@label"] = hl.syntax["Label"], -- labels
    ["@module"] = hl.syntax["StorageClass"], -- modules and namespaces

    -- literals
    ["@string"] = hl.syntax["String"], -- strings
    -- ["@string.regexp"] = hl.syntax["SpecialChar"], -- regex
    -- ["@string.escape"] = hl.syntax["SpecialChar"], -- escape characters within string
    -- ["@string.special.symbol"] = hl.syntax["Special"],
    -- ["@string.special.url"] = { fg = c.c11 }, -- urls, links, emails

    ["@character"] = hl.syntax["Character"], -- character literals
    -- ["@character.special"] = hl.syntax["SpecialChar"], -- special characters

    ["@boolean"] = hl.syntax["Boolean"], -- booleans
    ["@number"] = hl.syntax["Number"], -- all numbers
    -- ["@number.float"] = hl.syntax["Float"], -- floats

    -- types
    ["@type"] = hl.syntax["Type"], -- types
    ["@type.builtin"] = hl.syntax["Label"], --builtin types
    -- ["@type.definition"] = hl.syntax["Typedef"], -- typedefs
    -- ["@type.qualifier"] = { fg = c.c16 }, -- type qualifiers, like 'const'

    ["@attribute"] = { fg = c.c12 }, -- attributes, like <decorators> in python
    ["@property"] = { fg = c.c0 }, --same as TSField

    -- functions
    ["@function"] = hl.syntax["Function"], -- functions
    ["@function.builtin"] = hl.syntax["Label"], --builtin functions
    ["@function.macro"] = hl.syntax["Macro"], -- macro defined functions
    -- ["@function.call"] = { fg = c.c11, fmt = config.code_style.functions }, -- function calls
    --
    -- ["@function.method"] = hl.syntax["Function"], -- method definitions
    -- ["@function.method.call"] = hl.syntax["Function"], -- method calls

    ["@constructor"] = { fg = c.c2, fmt = config.code_style.functions }, -- constructor calls and definitions, `= { }` in lua
    ["@operator"] = hl.syntax["Operator"], -- operators, like `+`

    -- keywords
    ["@keyword"] = hl.syntax["Statement"], -- keywords that don't fall in previous categories
    ["@keyword.function"] = hl.syntax["Function"], -- keywords used to define a function
    ["@keyword.conditional"] = hl.syntax["Conditional"], -- keywords used to define a function
    ["@keyword.operator"] = hl.syntax["Conditional"], -- new keyword operator
    ["@keyword.import"] = hl.syntax["Include"], -- includes, like '#include' in c, 'require' in lua
    ["@keyword.storage"] = hl.syntax["StorageClass"], -- visibility/life-time 'static'
    ["@keyword.repeat"] = hl.syntax["Repeat"], -- for keywords related to loops
    ["@keyword.exception"] = hl.syntax["Exception"], -- exception related keywords

    -- punctuation
    ["@punctuation.delimiter"] = { fg = c.c6 }, -- delimiters, like `; . , `
    ["@punctuation.bracket"] = { fg = c.c6 }, -- brackets and parentheses
    ["@punctuation.special"] = { fg = c.c6 }, -- punctuation that does not fall into above categories, like `{}` in string interpolation

    -- comment
    ["@comment"] = hl.syntax["Comment"],
    -- ["@comment.error"] = hl.syntax["Comment"],
    -- ["@comment.warning"] = hl.syntax["Comment"],
    -- ["@comment.note"] = hl.syntax["Comment"],

    -- markup
    ["@markup"] = { fg = c.c7 }, -- text in markup language
    ["@markup.strong"] = { fg = c.c7, fmt = "bold" }, -- bold
    ["@markup.italic"] = { fg = c.c7, fmt = "italic" }, -- italic
    ["@markup.underline"] = { fg = c.c7, fmt = "underline" }, -- underline
    ["@markup.strikethrough"] = { fg = c.c6, fmt = "strikethrough" }, -- strikethrough
    ["@markup.heading"] = { fg = c.c11, fmt = "bold" }, -- markdown titles
    ["@markup.quote.markdown"] = { fg = c.c5 }, -- quotes with >
    ["@markup.link.uri"] = { fg = c.c10, fmt = "underline" }, -- urls, links, emails
    ["@markup.link"] = { fg = c.c13 }, -- text references, footnotes, citations, etc
    ["@markup.list"] = { fg = c.c10 },
    ["@markup.list.checked"] = { fg = c.c16 }, -- todo checked
    ["@markup.list.unchecked"] = { fg = c.c10 }, -- todo unchecked
    ["@markup.raw"] = { fg = c.c12 }, -- inline code in markdown, python doc `"""`
    ["@markup.math"] = { fg = c.c9 }, -- math environments, like `$$` in latex

    -- diff
    ["@diff.plus"] = { fg = c.c0 }, -- added text (diff files)
    ["@diff.minus"] = { fg = c.c9 }, -- removed text (diff files)
    ["@diff.delta"] = { fg = c.c11 }, -- changed text (diff files)

    -- tags
    ["@tag"] = hl.syntax["Tag"], -- tags, like in html
    ["@tag.attribute"] = { fg = c.c7 }, -- tags, like in html
    ["@tag.delimiter"] = { fg = c.c7 }, -- tag delimiter < >

    -- misc
    ["@error"] = hl.syntax["Error"],
  }
  if vim.api.nvim_call_function("has", { "nvim-0.9" }) == 1 then
    hl.lsp = {
      ["@lsp.type.comment"] = hl.treesitter["@comment"],
      ["@lsp.type.enum"] = hl.treesitter["@type"],
      ["@lsp.type.enumMember"] = hl.treesitter["@variable.builtin"],
      ["@lsp.type.interface"] = hl.treesitter["@type"],
      ["@lsp.type.typeParameter"] = hl.treesitter["@type"],
      ["@lsp.type.keyword"] = hl.treesitter["@keyword"],
      ["@lsp.type.namespace"] = hl.treesitter["@module"],
      ["@lsp.type.parameter"] = hl.treesitter["@variable"],
      ["@lsp.type.property"] = hl.treesitter["@property"],
      ["@lsp.type.variable"] = hl.treesitter["@variable"],
      ["@lsp.type.macro"] = hl.treesitter["@function.macro"],
      ["@lsp.type.method"] = hl.treesitter["@function"],
      ["@lsp.type.number"] = hl.treesitter["@number"],
      ["@lsp.type.generic"] = hl.treesitter["@markup"],
      ["@lsp.type.builtinType"] = hl.treesitter["@function.builtin"],
      ["@lsp.typemod.method.defaultLibrary"] = hl.treesitter["@function.builtin"],
      ["@lsp.typemod.function.defaultLibrary"] = hl.treesitter["@function.builtin"],
      ["@lsp.typemod.function.declaration"] = hl.treesitter["@function"],
      ["@lsp.typemod.operator.injected"] = hl.treesitter["@operator"],
      ["@lsp.typemod.string.injected"] = hl.treesitter["@string"],
      ["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@function.builtin"],
      ["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
      ["@lsp.typemod.variable.static"] = hl.treesitter["@constant"],
    }
  end

  -- legacy highlights
  hl.treesitter["@parameter"] = hl.treesitter["@variable.parameter"]
  hl.treesitter["@field"] = hl.treesitter["@variable.member"]
  hl.treesitter["@namespace"] = hl.treesitter["@module"]
  hl.treesitter["@float"] = hl.treesitter["number.float"]
  hl.treesitter["@symbol"] = hl.treesitter["@string.special.symbol"]
  hl.treesitter["@string.regex"] = hl.treesitter["@string.regexp"]

  hl.treesitter["@text"] = hl.treesitter["@markup"]
  hl.treesitter["@text.strong"] = hl.treesitter["@markup.strong"]
  hl.treesitter["@text.emphasis"] = hl.treesitter["@markup.italic"]
  hl.treesitter["@text.underline"] = hl.treesitter["@markup.underline"]
  hl.treesitter["@text.strike"] = hl.treesitter["@markup.strikethrough"]
  hl.treesitter["@text.uri"] = hl.treesitter["@markup.link.url"]
  hl.treesitter["@text.math"] = hl.treesitter["@markup.math"]
  hl.treesitter["@text.environment"] = hl.treesitter["@markup.environment"]
  hl.treesitter["@text.environment.name"] = hl.treesitter["@markup.environment.name"]

  hl.treesitter["@text.title"] = hl.treesitter["@markup.heading"]
  hl.treesitter["@text.literal"] = hl.treesitter["@markup.raw"]
  hl.treesitter["@text.reference"] = hl.treesitter["@markup.link"]

  hl.treesitter["@text.todo.checked"] = hl.treesitter["@markup.list.checked"]
  hl.treesitter["@text.todo.unchecked"] = hl.treesitter["@markup.list.unchecked"]

  -- @text.todo is now for todo comments, not todo notes like in markdown
  hl.treesitter["@text.todo"] = hl.treesitter["comment.warning"]
  hl.treesitter["@text.warning"] = hl.treesitter["comment.warning"]
  hl.treesitter["@text.note"] = hl.treesitter["comment.note"]
  hl.treesitter["@text.danger"] = hl.treesitter["comment.error"]

  -- @text.uri is now
  -- @markup.link.url in markup links
  -- @string.special.url outside of markup
  hl.treesitter["text.uri"] = hl.treesitter["@markup.link.uri"]

  hl.treesitter["@method"] = hl.treesitter["@function.method"]
  hl.treesitter["@method.call"] = hl.treesitter["@function.method.call"]

  hl.treesitter["@text.diff.add"] = hl.treesitter["@diff.plus"]
  hl.treesitter["@text.diff.delete"] = hl.treesitter["@diff.minus"]

  hl.treesitter["@define"] = hl.treesitter["@keyword.directive.define"]
  hl.treesitter["@preproc"] = hl.treesitter["@keyword.directive"]
  hl.treesitter["@storageclass"] = hl.treesitter["@keyword.storage"]
  hl.treesitter["@conditional"] = hl.treesitter["@keyword.conditional"]
  hl.treesitter["exception"] = hl.treesitter["@keyword.exception"]
  hl.treesitter["@include"] = hl.treesitter["@keyword.import"]
  hl.treesitter["@repeat"] = hl.treesitter["@keyword.repeat"]

  hl.treesitter["@symbol.ruby"] = hl.treesitter["@string.special.symbol.ruby"]

  hl.treesitter["@variable.member.yaml"] = hl.treesitter["@field.yaml"]

  hl.treesitter["@text.title.1.markdown"] = hl.treesitter["@markup.heading.1.markdown"]
  hl.treesitter["@text.title.2.markdown"] = hl.treesitter["@markup.heading.2.markdown"]
  hl.treesitter["@text.title.3.markdown"] = hl.treesitter["@markup.heading.3.markdown"]
  hl.treesitter["@text.title.4.markdown"] = hl.treesitter["@markup.heading.4.markdown"]
  hl.treesitter["@text.title.5.markdown"] = hl.treesitter["@markup.heading.5.markdown"]
  hl.treesitter["@text.title.6.markdown"] = hl.treesitter["@markup.heading.6.markdown"]
end

-- TODO:
local diagnostics_error_color = config.diagnostics.darker and c.c18 or c.c9
local diagnostics_hint_color = config.diagnostics.darker and c.dark_c13 or c.c14
local diagnostics_warn_color = config.diagnostics.darker and c.dark_c17 or c.c17
local diagnostics_info_color = config.diagnostics.darker and c.dark_cyan or c.c15
hl.plugins.lsp = {
  LspCxxHlGroupEnumConstant = { fg = c.c16 },
  LspCxxHlGroupMemberVariable = { fg = c.c16 },
  LspCxxHlGroupNamespace = { fg = c.c11 },
  LspCxxHlSkippedRegion = { fg = c.c5 },
  LspCxxHlSkippedRegionBeginEnd = { fg = c.c9 },

  DiagnosticError = { fg = c.c9 },
  DiagnosticHint = { fg = c.c14 },
  DiagnosticInfo = { fg = c.c10, fmt = "italic" },
  DiagnosticWarn = { fg = c.c17 },

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
    sp = c.c9,
  },
  DiagnosticUnderlineHint = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.c14,
  },
  DiagnosticUnderlineInfo = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.c11,
  },
  DiagnosticUnderlineWarn = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.c17,
  },

  LspReferenceText = { bg = c.c4 },
  LspReferenceWrite = { bg = c.c4 },
  LspReferenceRead = { bg = c.c4 },

  LspCodeLens = { fg = c.c5, fmt = config.code_style.comments },
  LspCodeLensSeparator = { fg = c.c5 },
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

hl.plugins.ale = {
  ALEErrorSign = hl.plugins.lsp.DiagnosticError,
  ALEInfoSign = hl.plugins.lsp.DiagnosticInfo,
  ALEWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.barbar = {
  BufferCurrent = { fmt = "bold" },
  BufferCurrentMod = { fg = c.c16, fmt = "bold,italic" },
  BufferCurrentSign = { fg = c.c14 },
  BufferInactiveMod = { fg = c.c6, bg = c.line, fmt = "italic" },
  BufferVisible = { fg = c.c6, bg = c.bg },
  BufferVisibleMod = { fg = c.c17, bg = c.bg, fmt = "italic" },
  BufferVisibleIndex = { fg = c.c6, bg = c.bg },
  BufferVisibleSign = { fg = c.c6, bg = c.bg },
  BufferVisibleTarget = { fg = c.c6, bg = c.bg },
}

hl.plugins.cmp = {
  CmpItemAbbr = { fg = c.c7 },
  CmpItemAbbrDeprecated = { fg = c.c6, fmt = "strikethrough" },
  CmpItemAbbrMatch = { fg = c.c15 },
  CmpItemAbbrMatchFuzzy = { fg = c.c15, fmt = "underline" },
  CmpItemMenu = { fg = c.c6 },
  CmpItemKind = { fg = c.c7, fmt = config.cmp_itemkind_reverse and "reverse" },
}

hl.plugins.coc = {
  CocErrorSign = hl.plugins.lsp.DiagnosticError,
  CocHintSign = hl.plugins.lsp.DiagnosticHint,
  CocInfoSign = hl.plugins.lsp.DiagnosticInfo,
  CocWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.whichkey = {
  WhichKey = { fg = c.c9 },
  WhichKeyDesc = { fg = c.c11 },
  WhichKeyGroup = { fg = c.c16 },
  WhichKeySeparator = { fg = c.c7 },
}

hl.plugins.gitgutter = {
  GitGutterAdd = { fg = c.c7 },
  GitGutterChange = { fg = c.c11 },
  GitGutterDelete = { fg = c.c9 },
}

hl.plugins.hop = {
  HopNextKey = { fg = c.c9, fmt = "bold" },
  HopNextKey1 = { fg = c.c15, fmt = "bold" },
  HopNextKey2 = { fg = util.darken(c.c11, 0.7) },
  HopUnmatched = { fg = c.c5 },
}

-- comment
hl.plugins.diffview = {
  DiffviewFilePanelTitle = { fg = c.c11, fmt = "bold" },
  DiffviewFilePanelCounter = { fg = c.c14, fmt = "bold" },
  DiffviewFilePanelFileName = { fg = c.c7 },
  DiffviewNormal = hl.common.Normal,
  DiffviewCursorLine = hl.common.CursorLine,
  DiffviewVertSplit = hl.common.VertSplit,
  DiffviewSignColumn = hl.common.SignColumn,
  DiffviewStatusLine = hl.common.StatusLine,
  DiffviewStatusLineNC = hl.common.StatusLineNC,
  DiffviewEndOfBuffer = hl.common.EndOfBuffer,
  DiffviewFilePanelRootPath = { fg = c.c5 },
  DiffviewFilePanelPath = { fg = c.c5 },
  DiffviewFilePanelInsertions = { fg = c.c7 },
  DiffviewFilePanelDeletions = { fg = c.c9 },
  DiffviewStatusAdded = { fg = c.c7 },
  DiffviewStatusUntracked = { fg = c.c11 },
  DiffviewStatusModified = { fg = c.c11 },
  DiffviewStatusRenamed = { fg = c.c11 },
  DiffviewStatusCopied = { fg = c.c11 },
  DiffviewStatusTypeChange = { fg = c.c11 },
  DiffviewStatusUnmerged = { fg = c.c11 },
  DiffviewStatusUnknown = { fg = c.c9 },
  DiffviewStatusDeleted = { fg = c.c9 },
  DiffviewStatusBroken = { fg = c.c9 },
}

hl.plugins.gitsigns = {
  GitSignsAdd = { fg = c.c0 },
  GitSignsAddLn = { fg = c.c0 },
  GitSignsAddNr = { fg = c.c0 },
  GitSignsChange = { fg = c.c11 },
  GitSignsChangeLn = { fg = c.c11 },
  GitSignsChangeNr = { fg = c.c11 },
  GitSignsDelete = { fg = c.c9 },
  GitSignsDeleteLn = { fg = c.c9 },
  GitSignsDeleteNr = { fg = c.c9 },
}

hl.plugins.neo_tree = {
  NeoTreeNormal = { fg = c.c7, bg = config.transparent and c.none or c.float },
  NeoTreeNormalNC = { fg = c.c7, bg = config.transparent and c.none or c.float },
  NeoTreeVertSplit = { fg = c.c4, bg = config.transparent and c.none or c.c4 },
  NeoTreeWinSeparator = { fg = c.c4, bg = config.transparent and c.none or c.c4 },
  NeoTreeEndOfBuffer = {
    fg = config.show_eob and c.c4 or c.float,
    bg = config.transparent and c.none or c.float,
  },
  NeoTreeRootName = { fg = c.c16, fmt = "bold" },
  NeoTreeGitAdded = { fg = c.c7 },
  NeoTreeGitDeleted = { fg = c.c9 },
  NeoTreeGitModified = { fg = c.c17 },
  NeoTreeGitConflict = { fg = c.c9, fmt = "bold,italic" },
  NeoTreeGitUntracked = { fg = c.c9, fmt = "italic" },
  NeoTreeIndentMarker = { fg = c.c5 },
  NeoTreeSymbolicLinkTarget = { fg = c.c14 },
}

hl.plugins.neotest = {
  NeotestAdapterName = { fg = c.c14, fmt = "bold" },
  NeotestDir = { fg = c.c15 },
  NeotestExpandMarker = { fg = c.c5 },
  NeotestFailed = { fg = c.c9 },
  NeotestFile = { fg = c.c15 },
  NeotestFocused = { fmt = "bold,italic" },
  NeotestIndent = { fg = c.c5 },
  NeotestMarked = { fg = c.c16, fmt = "bold" },
  NeotestNamespace = { fg = c.c11 },
  NeotestPassed = { fg = c.c7 },
  NeotestRunning = { fg = c.c17 },
  NeotestWinSelect = { fg = c.c15, fmt = "bold" },
  NeotestSkipped = { fg = c.c6 },
  NeotestTarget = { fg = c.c14 },
  NeotestTest = { fg = c.c7 },
  NeotestUnknown = { fg = c.c6 },
}

hl.plugins.nvim_tree = {
  NvimTreeNormal = { fg = c.c7, bg = config.transparent and c.none or c.float },
  NvimTreeVertSplit = { fg = c.float, bg = config.transparent and c.none or c.float },
  NvimTreeEndOfBuffer = {
    fg = config.show_eob and c.c4 or c.float,
    bg = config.transparent and c.none or c.float,
  },
  NvimTreeRootFolder = { fg = c.c16, fmt = "bold" },
  NvimTreeGitDirty = { fg = c.c17 },
  NvimTreeGitNew = { fg = c.c7 },
  NvimTreeGitDeleted = { fg = c.c9 },
  NvimTreeSpecialFile = { fg = c.c17, fmt = "underline" },
  NvimTreeIndentMarker = { fg = c.c7 },
  -- TODO:
  -- NvimTreeImageFile = { fg = c.dark_c13 },
  NvimTreeSymlink = { fg = c.c14 },
  NvimTreeFolderName = { fg = c.c11 },
}
hl.plugins.telescope = {
  TelescopeBorder = { fg = c.border },
  TelescopeMatching = { fg = c.c16, fmt = "bold" },
  TelescopePromptPrefix = { fg = c.c1 },
  TelescopeSelection = { fg = c.c16, bg = c.bg },
  TelescopeSelectionCaret = { fg = c.c16 },
  TelescopeResultsNormal = { fg = c.c7 },
}

hl.plugins.dashboard = {
  DashboardShortCut = { fg = c.c11 },
  DashboardHeader = { fg = c.c11 },
  DashboardCenter = { fg = c.c7 },
  DashboardFooter = { fg = c.c13, fmt = "italic" },
}

hl.plugins.outline = {
  FocusedSymbol = { fg = c.c14, bg = c.c4, fmt = "bold" },
  AerialLine = { fg = c.c14, bg = c.c4, fmt = "bold" },
}

hl.plugins.navic = {
  NavicText = { fg = c.c7 },
  NavicSeparator = { fg = c.c6 },
}

hl.plugins.ts_rainbow = {
  rainbowcol1 = { fg = c.c6 },
  rainbowcol2 = { fg = c.c17 },
  rainbowcol3 = { fg = c.c11 },
  rainbowcol4 = { fg = c.c16 },
  rainbowcol5 = { fg = c.c14 },
  rainbowcol6 = { fg = c.c7 },
  rainbowcol7 = { fg = c.c9 },
}

hl.plugins.ts_rainbow2 = {
  TSRainbowRed = { fg = c.c9 },
  TSRainbowc17 = { fg = c.c17 },
  TSRainbowBlue = { fg = c.c11 },
  TSRainbowc16 = { fg = c.c16 },
  TSRainbowc1 = { fg = c.c7 },
  TSRainbowViolet = { fg = c.c14 },
  TSRainbowc15 = { fg = c.c15 },
}

hl.plugins.rainbow_delimiters = {
  RainbowDelimiterRed = { fg = c.c9 },
  RainbowDelimiterc17 = { fg = c.c17 },
  RainbowDelimiterBlue = { fg = c.c11 },
  RainbowDelimiterc16 = { fg = c.c16 },
  RainbowDelimiterc1 = { fg = c.c7 },
  RainbowDelimiterViolet = { fg = c.c14 },
  RainbowDelimiterc15 = { fg = c.c15 },
}

hl.plugins.indent_blankline = {
  IndentBlanklineIndent1 = { fg = c.c11 },
  IndentBlanklineIndent2 = { fg = c.c7 },
  IndentBlanklineIndent3 = { fg = c.c15 },
  IndentBlanklineIndent4 = { fg = c.c6 },
  IndentBlanklineIndent5 = { fg = c.c14 },
  IndentBlanklineIndent6 = { fg = c.c9 },
  IndentBlanklineChar = { fg = c.c4, fmt = "nocombine" },
  IndentBlanklineContextChar = { fg = c.c5, fmt = "nocombine" },
  IndentBlanklineContextStart = { sp = c.c5, fmt = "underline" },
  IndentBlanklineContextSpaceChar = { fmt = "nocombine" },

  -- Ibl v3
  IblIndent = { fg = c.c4, fmt = "nocombine" },
  IblWhitespace = { fg = c.c5, fmt = "nocombine" },
  IblScope = { fg = c.c5, fmt = "nocombine" },
}

hl.plugins.mini = {
  MiniCompletionActiveParameter = { fmt = "underline" },

  MiniCursorword = { fmt = "underline" },
  MiniCursorwordCurrent = { fmt = "underline" },

  MiniIndentscopeSymbol = { fg = c.c5 },
  MiniIndentscopePrefix = { fmt = "nocombine" }, -- Make it invisible

  MiniJump = { fg = c.c14, fmt = "underline", sp = c.c13 },

  MiniJump2dSpot = { fg = c.c9, fmt = "bold,nocombine" },

  MiniStarterCurrent = { fmt = "nocombine" },
  -- TODO:
  -- MiniStarterFooter = { fg = c.vis_c3, fmt = "italic" },
  MiniStarterHeader = { fg = c.c17 },
  MiniStarterInactive = { fg = c.c5, fmt = config.code_style.comments },
  MiniStarterItem = { fg = c.c7, bg = config.transparent and c.none or c.bg },
  MiniStarterItemBullet = { fg = c.c5 },
  MiniStarterItemPrefix = { fg = c.c17 },
  MiniStarterSection = { fg = c.c6 },
  MiniStarterQuery = { fg = c.c15 },

  MiniStatuslineDevinfo = { fg = c.c7, bg = c.c4 },
  MiniStatuslineFileinfo = { fg = c.c7, bg = c.c4 },
  MiniStatuslineFilename = { fg = c.c5, bg = c.c4 },
  MiniStatuslineInactive = { fg = c.c5, bg = c.bg },
  MiniStatuslineModeCommand = { fg = c.bg, bg = c.c17, fmt = "bold" },
  MiniStatuslineModeInsert = { fg = c.bg, bg = c.c11, fmt = "bold" },
  MiniStatuslineModeNormal = { fg = c.bg, bg = c.c7, fmt = "bold" },
  MiniStatuslineModeOther = { fg = c.bg, bg = c.c15, fmt = "bold" },
  MiniStatuslineModeReplace = { fg = c.bg, bg = c.c9, fmt = "bold" },
  MiniStatuslineModeVisual = { fg = c.bg, bg = c.c14, fmt = "bold" },

  MiniSurround = { fg = c.bg, bg = c.c16 },

  MiniTablineCurrent = { fmt = "bold" },
  MiniTablineFill = { fg = c.c5, bg = c.c4 },
  MiniTablineHidden = { fg = c.c7, bg = c.c4 },
  MiniTablineModifiedCurrent = { fg = c.c16, fmt = "bold,italic" },
  MiniTablineModifiedHidden = { fg = c.c6, bg = c.c4, fmt = "italic" },
  MiniTablineModifiedVisible = { fg = c.c17, bg = c.bg, fmt = "italic" },
  -- TODO:
  -- MiniTablineTabpagesection = { fg = c.bg, bg = c.bg_c17 },
  MiniTablineVisible = { fg = c.c6, bg = c.bg },

  MiniTestEmphasis = { fmt = "bold" },
  MiniTestFail = { fg = c.c9, fmt = "bold" },
  MiniTestPass = { fg = c.c7, fmt = "bold" },

  MiniTrailspace = { bg = c.c9 },
}

-- TODO: todo highglights

local lsp_kind_icons_color = {
  Default = c.c14,
  Array = c.c17,
  Boolean = c.c16,
  Class = c.c17,
  Color = c.c7,
  Constant = c.c16,
  Constructor = c.c11,
  Enum = c.c14,
  EnumMember = c.c17,
  Event = c.c17,
  Field = c.c14,
  File = c.c11,
  Folder = c.c16,
  Function = c.c11,
  Interface = c.c7,
  Key = c.c15,
  Keyword = c.c15,
  Method = c.c11,
  Module = c.c16,
  Namespace = c.c9,
  Null = c.c5,
  Number = c.c16,
  Object = c.c9,
  Operator = c.c9,
  Package = c.c17,
  Property = c.c15,
  Reference = c.c16,
  Snippet = c.c9,
  String = c.c7,
  Struct = c.c14,
  Text = c.c6,
  TypeParameter = c.c9,
  Unit = c.c7,
  Value = c.c16,
  Variable = c.c14,
}

-- TODO: notify of nvim 0.8 requirement
function M.setup()
  --
  -- define cmp and aerial kind highlights with lsp_kind_icons_color
  for kind, color in pairs(lsp_kind_icons_color) do
    hl.plugins.cmp["CmpItemKind" .. kind] =
      { fg = color, fmt = config.cmp_itemkind_reverse and "reverse" }
    hl.plugins.outline["Aerial" .. kind .. "Icon"] = { fg = color }
    hl.plugins.navic["NavicIcons" .. kind] = { fg = color }
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
            'saguaro.nvim: unknown color "' .. name .. '"',
            vim.log.levels.ERROR,
            { title = "saguaro.nvim" }
          )
        end)
        return ""
      end
    end
    return prefix .. "=" .. color_name
  end

  for group_name, group_settings in pairs(vim.g.saguaro_config.highlights) do
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

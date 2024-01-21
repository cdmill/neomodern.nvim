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
  ColorColumn = { bg = c.bg2 },
  Conceal = { fg = c.bg4, bg = c.bg2 },
  CurSearch = { fg = c.orange, bg = c.bg4 },
  Cursor = { fmt = "reverse" },
  vCursor = { fmt = "reverse" },
  iCursor = { fmt = "reverse" },
  lCursor = { fmt = "reverse" },
  CursorIM = { fmt = "reverse" },
  CursorColumn = { bg = c.bg2 },
  CursorLine = { bg = c.bg2 },
  CursorLineNr = { fg = c.main2 },
  Debug = { fg = c.yellow },
  debugPC = { fg = c.bg0, bg = c.fg },
  debugBreakpoint = { fg = c.bg0, bg = c.red },
  DiffAdd = { fg = c.none, bg = c.diff_add },
  DiffChange = { fg = c.none, bg = c.diff_change },
  DiffDelete = { fg = c.none, bg = c.diff_delete },
  DiffText = { fg = c.none, bg = c.diff_text },
  DiffAdded = { fg = c.fg },
  DiffRemoved = { fg = c.red },
  DiffFile = { fg = c.brown },
  DiffIndexLine = { fg = c.bg4 },
  Directory = { fg = c.main1 },
  ErrorMsg = { fg = c.red, fmt = "bold" },
  EndOfBuffer = {
    fg = config.show_eob and c.bg3 or c.bg0,
    bg = config.transparent and c.none or c.bg0,
  },
  FloatBorder = { fg = c.bg4, bg = c.bg1 },
  Folded = { fg = c.fg, bg = config.transparent and c.none or c.bg2 },
  FoldColumn = { fg = c.fg, bg = config.transparent and c.none or c.bg0 },
  IncSearch = { fg = c.orange, bg = c.bg4 },
  LineNr = { fg = c.bg3 },
  MatchParen = { fg = c.bg0, bg = c.orange },
  MoreMsg = { fg = c.blue, fmt = "bold" },
  NonText = { fg = c.bg4 },
  Normal = { fg = c.fg, bg = config.transparent and c.none or c.bg0 },
  NormalFloat = { fg = c.fg, bg = c.bg1 },
  Pmenu = { fg = c.fg, bg = c.bg2 },
  PmenuSbar = { fg = c.none, bg = c.bg2 },
  PmenuSel = { fg = c.orange },
  PmenuThumb = { fg = c.none, bg = c.bg2 },
  Question = { fg = c.yellow },
  QuickFixLine = { fg = c.blue, fmt = "underline" },
  Search = { fg = c.blue, bg = c.bg4 },
  SignColumn = { fg = c.fg, bg = config.transparent and c.none or c.bg0 },
  SpecialKey = { fg = c.bg4 },
  SpellBad = { fg = c.none, fmt = "undercurl", sp = c.red },
  SpellCap = { fg = c.none, fmt = "undercurl", sp = c.yellow },
  SpellLocal = { fg = c.none, fmt = "undercurl", sp = c.pink },
  SpellRare = { fg = c.none, fmt = "undercurl", sp = c.purple2 },
  StatusLine = { fg = c.fg, bg = c.bg3 },
  StatusLineTerm = { fg = c.fg, bg = c.bg2 },
  StatusLineNC = { fg = c.bg4, bg = c.bg2 },
  StatusLineTermNC = { fg = c.bg4, bg = c.bg2 },
  Substitute = { fg = c.bg0, bg = c.fg },
  TabLine = { fg = c.fg, bg = c.bg2 },
  TabLineFill = { fg = c.bg4, bg = c.bg2 },
  TabLineSel = { fg = c.bg0, bg = c.fg },
  Terminal = { fg = c.fg, bg = config.transparent and c.none or c.bg0 },
  ToolbarButton = { fg = c.bg0, bg = c.vis_bg1 },
  ToolbarLine = { fg = c.fg },
  Visual = { bg = c.vis_bg2 },
  VisualNOS = { fg = c.none, bg = c.bg3, fmt = "underline" },
  WarningMsg = { fg = c.orange, fmt = "bold" },
  Whitespace = { fg = c.bg4 },
  WildMenu = { fg = c.bg0, bg = c.blue },
  WinSeparator = { fg = c.bg1 },
}

hl.syntax = {
  Boolean = { fg = c.fg }, -- boolean constants
  Character = { fg = c.fg }, -- character constants
  Comment = { fg = c.bg4, fmt = config.code_style.comments }, -- comments
  Conditional = { fg = c.purple, fmt = config.code_style.keywords }, -- conditionals
  Constant = { fg = c.fg, fmt = config.code_style.constants }, -- (preferred) any constant
  Define = { fg = c.purple }, -- preprocessor '#define'
  Delimiter = { fg = c.fg }, -- delimiter characters
  Float = { fg = c.orange }, -- float constants
  Function = { fg = c.blue, fmt = config.code_style.functions }, -- functions
  Error = { fg = c.fg }, -- (preferred) any erroneous construct
  Exception = { fg = c.fg }, -- 'try', 'catch', 'throw'
  Identifier = { fg = c.fg, fmt = config.code_style.variables }, -- (preferred) any variable
  Include = { fg = c.purple, fmt = config.code_style.keywords }, -- preprocessor '#include'
  Keyword = { fg = c.purple, fmt = config.code_style.keywords }, -- any other keyword
  Label = { fg = c.yellow }, -- 'case', 'default', etc
  Macro = { fg = c.purple, fmt = config.code_style.constants }, -- macros
  Number = { fg = c.orange }, -- number constant
  Operator = { fg = c.fg }, -- '+', '*', 'sizeof' etc
  PreProc = { fg = c.fg }, -- (preferred) generic preprocessor
  PreCondit = { fg = c.fg }, -- preprocessor conditionals '#if', '#endif' etc
  Repeat = { fg = c.purple, fmt = config.code_style.keywords }, -- loop keywords: 'for', 'while' etc
  Special = { fg = c.fg }, -- (preferred) any special symbol
  SpecialChar = { fg = c.yellow }, -- special character in a constant
  SpecialComment = { fg = c.fg, fmt = config.code_style.comments }, -- special things inside comments
  Statement = { fg = c.blue2 }, -- (preferred) any statement
  StorageClass = { fg = c.fg, fmt = config.code_style.keywords }, -- 'static', 'volatile' etc
  String = { fg = c.main1, fmt = config.code_style.strings }, -- string constants
  Structure = { fg = c.fg }, -- 'struct', 'union', 'enum' etc
  Tag = { fg = c.main1 }, -- can use <C-}> on this
  Title = { fg = c.main0 },
  Type = { fg = c.blue2 }, -- (preferred) 'int', 'long', 'char' etc
  Typedef = { fg = c.fg }, -- 'typedef'
  Todo = { fg = c.fg, fmt = config.code_style.comments }, -- (preferred) 'TODO' keywords in comments
}

if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
  hl.treesitter = {
    -- identifiers
    ["@variable"] = hl.syntax["Identifier"], -- any variable that does not have another highlight
    ["@variable.builtin"] = { fg = c.pink, fmt = config.code_style.variables }, -- variable names that are defined by the language, like 'this' or 'self'
    ["@variable.parameter"] = { fg = c.red }, -- parameters of a function
    ["@variable.field"] = { fg = c.pink }, -- fields

    ["@constant"] = hl.syntax["Constant"], -- constants
    ["@constant.builtin"] = hl.syntax["Constant"], -- constants that are defined by the language, like 'nil' in lua
    ["@constant.macro"] = hl.syntax["Macro"], -- constants that are defined by macros like 'NULL' in c

    ["@label"] = { fg = c.fg }, -- labels
    ["@module"] = { fg = c.fg }, -- modules and namespaces

    -- literals
    ["@string"] = hl.syntax["String"], -- strings
    ["@string.regexp"] = { fg = c.fg, fmt = config.code_style.strings }, -- regex
    ["@string.escape"] = { fg = c.fg, fmt = config.code_style.strings }, -- escape characters within string
    ["@string.special.symbol"] = hl.syntax["Special"],
    ["@string.special.url"] = { fg = c.fg }, -- urls, links, emails

    ["@character"] = hl.syntax["Character"], -- character literals
    ["@character.special"] = hl.syntax["SpecialChar"], -- special characters

    ["@boolean"] = hl.syntax["Boolean"], -- booleans
    ["@number"] = hl.syntax["Number"], -- all numbers
    ["@number.float"] = hl.syntax["Float"], -- floats

    -- types
    ["@type"] = hl.syntax["Type"], -- types
    ["@type.builtin"] = { fg = c.fg }, --builtin types
    ["@type.definition"] = hl.syntax["Typedef"], -- typedefs
    ["@type.qualifier"] = { fg = c.fg }, -- type qualifiers, like 'const'

    ["@attribute"] = { fg = c.fg }, -- attributes, like <decorators> in python
    ["@property"] = { fg = c.main0 }, --same as TSField

    -- functions
    ["@function"] = hl.syntax["Function"], -- functions
    ["@function.builtin"] = { fg = c.blue2, fmt = config.code_style.functions }, --builtin functions
    ["@function.call"] = { fg = c.blue, fmt = config.code_style.functions }, -- function calls
    ["@function.macro"] = { fg = c.blue2, fmt = config.code_style.functions }, -- macro defined functions
    --
    ["@function.method"] = { fg = c.blue, fmt = config.code_style.functions }, -- method definitions
    ["@function.method.call"] = { fg = c.fg, fmt = config.code_style.functions }, -- method calls

    ["@constructor"] = { fg = c.fg, fmt = "bold" }, -- constructor calls and definitions, `= { }` in lua
    ["@operator"] = hl.syntax["Operator"], -- operators, like `+`

    -- keywords
    ["@keyword"] = hl.syntax["Keyword"], -- keywords that don't fall in previous categories
    ["@keyword.function"] = { fg = c.fg, fmt = config.code_style.functions }, -- keywords used to define a function
    ["@keyword.operator"] = { fg = c.fg, fmt = config.code_style.keywords }, -- new keyword operator
    ["@keyword.import"] = hl.syntax["Include"], -- includes, like '#include' in c, 'require' in lua
    ["@keyword.storage"] = hl.syntax["StorageClass"], -- visibility/life-time 'static'
    ["@keyword.repeat"] = hl.syntax["Repeat"], -- for keywords related to loops
    ["@keyword.exception"] = hl.syntax["Exception"], -- exception related keywords

    -- punctuation
    ["@punctuation.delimiter"] = { fg = c.fg_dim }, -- delimiters, like `; . , `
    ["@punctuation.bracket"] = { fg = c.fg_dim }, -- brackets and parentheses
    ["@punctuation.special"] = { fg = c.fg_dim }, -- punctuation that does not fall into above categories, like `{}` in string interpolation

    -- comment
    ["@comment"] = hl.syntax["Comment"],
    ["@comment.error"] = hl.syntax["Comment"],
    ["@comment.warning"] = hl.syntax["Comment"],
    ["@comment.note"] = hl.syntax["Comment"],

    -- markup
    ["@markup"] = { fg = c.fg }, -- text in markup language
    ["@markup.strong"] = { fg = c.fg, fmt = "bold" }, -- bold
    ["@markup.italic"] = { fg = c.fg, fmt = "italic" }, -- italic
    ["@markup.underline"] = { fg = c.fg, fmt = "underline" }, -- underline
    ["@markup.strikethrough"] = { fg = c.fg_dim, fmt = "strikethrough" }, -- strikethrough
    ["@markup.heading"] = { fg = c.main0, fmt = "bold" }, -- markdown titles
    ["@markup.link.uri"] = { fg = c.blue, fmt = "underline" }, -- urls, links, emails
    ["@markup.link"] = { fg = c.purple }, -- text references, footnotes, citations, etc
    ["@markup.list"] = { fg = c.main1 },
    ["@markup.list.checked"] = { fg = c.red }, -- todo checked
    ["@markup.list.unchecked"] = { fg = c.red }, -- todo unchecked
    ["@markup.raw"] = { fg = c.main1 }, -- inline code in markdown, python doc `"""`
    ["@markup.math"] = { fg = c.blue }, -- math environments, like `$$` in latex

    -- diff
    ["@diff.plus"] = { fg = c.fg }, -- added text (diff files)
    ["@diff.minus"] = { fg = c.red }, -- removed text (diff files)
    ["@diff.delta"] = { fg = c.blue }, -- changed text (diff files)

    -- tags
    ["@tag"] = hl.syntax["Tag"], -- tags, like in html
    ["@tag.attribute"] = { fg = c.fg }, -- tags, like in html
    ["@tag.delimiter"] = { fg = c.fg }, -- tag delimiter < >

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
      ["@lsp.type.parameter"] = hl.treesitter["@variable.parameter"],
      ["@lsp.type.property"] = hl.treesitter["@property"],
      ["@lsp.type.variable"] = hl.treesitter["@variable"],
      ["@lsp.type.macro"] = hl.treesitter["@function.macro"],
      ["@lsp.type.method"] = hl.treesitter["@function.method"],
      ["@lsp.type.number"] = hl.treesitter["@number"],
      ["@lsp.type.generic"] = hl.treesitter["@markup"],
      ["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
      ["@lsp.typemod.method.defaultLibrary"] = hl.treesitter["@function"],
      ["@lsp.typemod.function.defaultLibrary"] = hl.treesitter["@function.builtin"],
      ["@lsp.typemod.function.declaration"] = hl.treesitter["@function.method"],
      ["@lsp.typemod.operator.injected"] = hl.treesitter["@operator"],
      ["@lsp.typemod.string.injected"] = hl.treesitter["@string"],
      ["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@variable.builtin"],
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
local diagnostics_error_color = config.diagnostics.darker and c.vis_bg2 or c.red
local diagnostics_hint_color = config.diagnostics.darker and c.dark_purple or c.purple2
local diagnostics_warn_color = config.diagnostics.darker and c.dark_yellow or c.yellow
local diagnostics_info_color = config.diagnostics.darker and c.dark_cyan or c.brown
hl.plugins.lsp = {
  LspCxxHlGroupEnumConstant = { fg = c.orange },
  LspCxxHlGroupMemberVariable = { fg = c.orange },
  LspCxxHlGroupNamespace = { fg = c.blue },
  LspCxxHlSkippedRegion = { fg = c.bg4 },
  LspCxxHlSkippedRegionBeginEnd = { fg = c.red },

  DiagnosticError = { fg = c.red },
  DiagnosticHint = { fg = c.purple2 },
  DiagnosticInfo = { fg = c.brown },
  DiagnosticWarn = { fg = c.yellow },

  DiagnosticVirtualTextError = {
    bg = config.diagnostics.background
        and util.darken(diagnostics_error_color, 0.1, c.bg0)
      or c.none,
    fg = diagnostics_error_color,
  },
  DiagnosticVirtualTextWarn = {
    bg = config.diagnostics.background
        and util.darken(diagnostics_warn_color, 0.1, c.bg0)
      or c.none,
    fg = diagnostics_warn_color,
  },
  DiagnosticVirtualTextInfo = {
    bg = config.diagnostics.background
        and util.darken(diagnostics_info_color, 0.1, c.bg0)
      or c.none,
    fg = diagnostics_info_color,
  },
  DiagnosticVirtualTextHint = {
    bg = config.diagnostics.background
        and util.darken(diagnostics_hint_color, 0.1, c.bg0)
      or c.none,
    fg = diagnostics_hint_color,
  },

  DiagnosticUnderlineError = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.red,
  },
  DiagnosticUnderlineHint = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.purple2,
  },
  DiagnosticUnderlineInfo = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.blue,
  },
  DiagnosticUnderlineWarn = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.yellow,
  },

  LspReferenceText = { bg = c.bg3 },
  LspReferenceWrite = { bg = c.bg3 },
  LspReferenceRead = { bg = c.bg3 },

  LspCodeLens = { fg = c.bg4, fmt = config.code_style.comments },
  LspCodeLensSeparator = { fg = c.bg4 },
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
  BufferCurrentMod = { fg = c.orange, fmt = "bold,italic" },
  BufferCurrentSign = { fg = c.purple2 },
  BufferInactiveMod = { fg = c.fg_dim, bg = c.bg2, fmt = "italic" },
  BufferVisible = { fg = c.fg_dim, bg = c.bg0 },
  BufferVisibleMod = { fg = c.yellow, bg = c.bg0, fmt = "italic" },
  BufferVisibleIndex = { fg = c.fg_dim, bg = c.bg0 },
  BufferVisibleSign = { fg = c.fg_dim, bg = c.bg0 },
  BufferVisibleTarget = { fg = c.fg_dim, bg = c.bg0 },
}

hl.plugins.cmp = {
  CmpItemAbbr = { fg = c.fg },
  CmpItemAbbrDeprecated = { fg = c.fg_dim, fmt = "strikethrough" },
  CmpItemAbbrMatch = { fg = c.brown },
  CmpItemAbbrMatchFuzzy = { fg = c.brown, fmt = "underline" },
  CmpItemMenu = { fg = c.fg_dim },
  CmpItemKind = { fg = c.fg, fmt = config.cmp_itemkind_reverse and "reverse" },
}

hl.plugins.coc = {
  CocErrorSign = hl.plugins.lsp.DiagnosticError,
  CocHintSign = hl.plugins.lsp.DiagnosticHint,
  CocInfoSign = hl.plugins.lsp.DiagnosticInfo,
  CocWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.whichkey = {
  WhichKey = { fg = c.red },
  WhichKeyDesc = { fg = c.blue },
  WhichKeyGroup = { fg = c.orange },
  WhichKeySeparator = { fg = c.fg },
}

hl.plugins.gitgutter = {
  GitGutterAdd = { fg = c.fg },
  GitGutterChange = { fg = c.blue },
  GitGutterDelete = { fg = c.red },
}

hl.plugins.hop = {
  HopNextKey = { fg = c.red, fmt = "bold" },
  HopNextKey1 = { fg = c.brown, fmt = "bold" },
  HopNextKey2 = { fg = util.darken(c.blue, 0.7) },
  HopUnmatched = { fg = c.bg4 },
}

-- comment
hl.plugins.diffview = {
  DiffviewFilePanelTitle = { fg = c.blue, fmt = "bold" },
  DiffviewFilePanelCounter = { fg = c.purple2, fmt = "bold" },
  DiffviewFilePanelFileName = { fg = c.fg },
  DiffviewNormal = hl.common.Normal,
  DiffviewCursorLine = hl.common.CursorLine,
  DiffviewVertSplit = hl.common.VertSplit,
  DiffviewSignColumn = hl.common.SignColumn,
  DiffviewStatusLine = hl.common.StatusLine,
  DiffviewStatusLineNC = hl.common.StatusLineNC,
  DiffviewEndOfBuffer = hl.common.EndOfBuffer,
  DiffviewFilePanelRootPath = { fg = c.bg4 },
  DiffviewFilePanelPath = { fg = c.bg4 },
  DiffviewFilePanelInsertions = { fg = c.fg },
  DiffviewFilePanelDeletions = { fg = c.red },
  DiffviewStatusAdded = { fg = c.fg },
  DiffviewStatusUntracked = { fg = c.blue },
  DiffviewStatusModified = { fg = c.blue },
  DiffviewStatusRenamed = { fg = c.blue },
  DiffviewStatusCopied = { fg = c.blue },
  DiffviewStatusTypeChange = { fg = c.blue },
  DiffviewStatusUnmerged = { fg = c.blue },
  DiffviewStatusUnknown = { fg = c.red },
  DiffviewStatusDeleted = { fg = c.red },
  DiffviewStatusBroken = { fg = c.red },
}

hl.plugins.gitsigns = {
  GitSignsAdd = { fg = c.fg },
  GitSignsAddLn = { fg = c.fg },
  GitSignsAddNr = { fg = c.fg },
  GitSignsChange = { fg = c.blue },
  GitSignsChangeLn = { fg = c.blue },
  GitSignsChangeNr = { fg = c.blue },
  GitSignsDelete = { fg = c.red },
  GitSignsDeleteLn = { fg = c.red },
  GitSignsDeleteNr = { fg = c.red },
}

hl.plugins.neo_tree = {
  NeoTreeNormal = { fg = c.fg, bg = config.transparent and c.none or c.bg1 },
  NeoTreeNormalNC = { fg = c.fg, bg = config.transparent and c.none or c.bg1 },
  NeoTreeVertSplit = { fg = c.bg2, bg = config.transparent and c.none or c.bg2 },
  NeoTreeWinSeparator = { fg = c.bg2, bg = config.transparent and c.none or c.bg2 },
  NeoTreeEndOfBuffer = {
    fg = config.show_eob and c.bg3 or c.bg1,
    bg = config.transparent and c.none or c.bg1,
  },
  NeoTreeRootName = { fg = c.orange, fmt = "bold" },
  NeoTreeGitAdded = { fg = c.fg },
  NeoTreeGitDeleted = { fg = c.red },
  NeoTreeGitModified = { fg = c.yellow },
  NeoTreeGitConflict = { fg = c.red, fmt = "bold,italic" },
  NeoTreeGitUntracked = { fg = c.red, fmt = "italic" },
  NeoTreeIndentMarker = { fg = c.bg4 },
  NeoTreeSymbolicLinkTarget = { fg = c.purple2 },
}

hl.plugins.neotest = {
  NeotestAdapterName = { fg = c.purple2, fmt = "bold" },
  NeotestDir = { fg = c.brown },
  NeotestExpandMarker = { fg = c.bg4 },
  NeotestFailed = { fg = c.red },
  NeotestFile = { fg = c.brown },
  NeotestFocused = { fmt = "bold,italic" },
  NeotestIndent = { fg = c.bg4 },
  NeotestMarked = { fg = c.orange, fmt = "bold" },
  NeotestNamespace = { fg = c.blue },
  NeotestPassed = { fg = c.fg },
  NeotestRunning = { fg = c.yellow },
  NeotestWinSelect = { fg = c.brown, fmt = "bold" },
  NeotestSkipped = { fg = c.fg_dim },
  NeotestTarget = { fg = c.purple2 },
  NeotestTest = { fg = c.fg },
  NeotestUnknown = { fg = c.fg_dim },
}

hl.plugins.nvim_tree = {
  NvimTreeNormal = { fg = c.fg, bg = config.transparent and c.none or c.bg1 },
  NvimTreeVertSplit = { fg = c.bg1, bg = config.transparent and c.none or c.bg1 },
  NvimTreeEndOfBuffer = {
    fg = config.show_eob and c.bg3 or c.bg1,
    bg = config.transparent and c.none or c.bg1,
  },
  NvimTreeRootFolder = { fg = c.orange, fmt = "bold" },
  NvimTreeGitDirty = { fg = c.yellow },
  NvimTreeGitNew = { fg = c.fg },
  NvimTreeGitDeleted = { fg = c.red },
  NvimTreeSpecialFile = { fg = c.yellow, fmt = "underline" },
  NvimTreeIndentMarker = { fg = c.fg },
  -- TODO:
  -- NvimTreeImageFile = { fg = c.dark_purple },
  NvimTreeSymlink = { fg = c.purple2 },
  NvimTreeFolderName = { fg = c.blue },
}
hl.plugins.telescope = {
  TelescopeBorder = { fg = c.bg3 },
  TelescopeMatching = { fg = c.orange, fmt = "bold" },
  TelescopePromptPrefix = { fg = c.main1 },
  TelescopeSelection = { fg = c.orange, bg = c.bg0 },
  TelescopeSelectionCaret = { fg = c.orange },
}

hl.plugins.dashboard = {
  DashboardShortCut = { fg = c.blue },
  DashboardHeader = { fg = c.yellow },
  DashboardCenter = { fg = c.brown },
  -- TODO:
  -- DashboardFooter = { fg = c.vis_bg2, fmt = "italic" },
}

hl.plugins.outline = {
  FocusedSymbol = { fg = c.purple2, bg = c.bg3, fmt = "bold" },
  AerialLine = { fg = c.purple2, bg = c.bg3, fmt = "bold" },
}

hl.plugins.navic = {
  NavicText = { fg = c.fg },
  NavicSeparator = { fg = c.fg_dim },
}

hl.plugins.ts_rainbow = {
  rainbowcol1 = { fg = c.fg_dim },
  rainbowcol2 = { fg = c.yellow },
  rainbowcol3 = { fg = c.blue },
  rainbowcol4 = { fg = c.orange },
  rainbowcol5 = { fg = c.purple2 },
  rainbowcol6 = { fg = c.fg },
  rainbowcol7 = { fg = c.red },
}

hl.plugins.ts_rainbow2 = {
  TSRainbowRed = { fg = c.red },
  TSRainbowYellow = { fg = c.yellow },
  TSRainbowBlue = { fg = c.blue },
  TSRainbowOrange = { fg = c.orange },
  TSRainbowmain1 = { fg = c.fg },
  TSRainbowViolet = { fg = c.purple2 },
  TSRainbowBrown = { fg = c.brown },
}

hl.plugins.rainbow_delimiters = {
  RainbowDelimiterRed = { fg = c.red },
  RainbowDelimiterYellow = { fg = c.yellow },
  RainbowDelimiterBlue = { fg = c.blue },
  RainbowDelimiterOrange = { fg = c.orange },
  RainbowDelimitermain1 = { fg = c.fg },
  RainbowDelimiterViolet = { fg = c.purple2 },
  RainbowDelimiterBrown = { fg = c.brown },
}

hl.plugins.indent_blankline = {
  IndentBlanklineIndent1 = { fg = c.blue },
  IndentBlanklineIndent2 = { fg = c.fg },
  IndentBlanklineIndent3 = { fg = c.brown },
  IndentBlanklineIndent4 = { fg = c.fg_dim },
  IndentBlanklineIndent5 = { fg = c.purple2 },
  IndentBlanklineIndent6 = { fg = c.red },
  IndentBlanklineChar = { fg = c.bg2, fmt = "nocombine" },
  IndentBlanklineContextChar = { fg = c.bg4, fmt = "nocombine" },
  IndentBlanklineContextStart = { sp = c.bg4, fmt = "underline" },
  IndentBlanklineContextSpaceChar = { fmt = "nocombine" },

  -- Ibl v3
  IblIndent = { fg = c.bg2, fmt = "nocombine" },
  IblWhitespace = { fg = c.bg4, fmt = "nocombine" },
  IblScope = { fg = c.bg4, fmt = "nocombine" },
}

hl.plugins.mini = {
  MiniCompletionActiveParameter = { fmt = "underline" },

  MiniCursorword = { fmt = "underline" },
  MiniCursorwordCurrent = { fmt = "underline" },

  MiniIndentscopeSymbol = { fg = c.bg4 },
  MiniIndentscopePrefix = { fmt = "nocombine" }, -- Make it invisible

  MiniJump = { fg = c.purple2, fmt = "underline", sp = c.purple },

  MiniJump2dSpot = { fg = c.red, fmt = "bold,nocombine" },

  MiniStarterCurrent = { fmt = "nocombine" },
  -- TODO:
  -- MiniStarterFooter = { fg = c.vis_bg2, fmt = "italic" },
  MiniStarterHeader = { fg = c.yellow },
  MiniStarterInactive = { fg = c.bg4, fmt = config.code_style.comments },
  MiniStarterItem = { fg = c.fg, bg = config.transparent and c.none or c.bg0 },
  MiniStarterItemBullet = { fg = c.bg4 },
  MiniStarterItemPrefix = { fg = c.yellow },
  MiniStarterSection = { fg = c.fg_dim },
  MiniStarterQuery = { fg = c.brown },

  MiniStatuslineDevinfo = { fg = c.fg, bg = c.bg3 },
  MiniStatuslineFileinfo = { fg = c.fg, bg = c.bg3 },
  MiniStatuslineFilename = { fg = c.bg4, bg = c.bg2 },
  MiniStatuslineInactive = { fg = c.bg4, bg = c.bg0 },
  MiniStatuslineModeCommand = { fg = c.bg0, bg = c.yellow, fmt = "bold" },
  MiniStatuslineModeInsert = { fg = c.bg0, bg = c.blue, fmt = "bold" },
  MiniStatuslineModeNormal = { fg = c.bg0, bg = c.fg, fmt = "bold" },
  MiniStatuslineModeOther = { fg = c.bg0, bg = c.brown, fmt = "bold" },
  MiniStatuslineModeReplace = { fg = c.bg0, bg = c.red, fmt = "bold" },
  MiniStatuslineModeVisual = { fg = c.bg0, bg = c.purple2, fmt = "bold" },

  MiniSurround = { fg = c.bg0, bg = c.orange },

  MiniTablineCurrent = { fmt = "bold" },
  MiniTablineFill = { fg = c.bg4, bg = c.bg2 },
  MiniTablineHidden = { fg = c.fg, bg = c.bg2 },
  MiniTablineModifiedCurrent = { fg = c.orange, fmt = "bold,italic" },
  MiniTablineModifiedHidden = { fg = c.fg_dim, bg = c.bg2, fmt = "italic" },
  MiniTablineModifiedVisible = { fg = c.yellow, bg = c.bg0, fmt = "italic" },
  -- TODO:
  -- MiniTablineTabpagesection = { fg = c.bg0, bg = c.bg_yellow },
  MiniTablineVisible = { fg = c.fg_dim, bg = c.bg0 },

  MiniTestEmphasis = { fmt = "bold" },
  MiniTestFail = { fg = c.red, fmt = "bold" },
  MiniTestPass = { fg = c.fg, fmt = "bold" },

  MiniTrailspace = { bg = c.red },
}

-- TODO: todo highglights

local lsp_kind_icons_color = {
  Default = c.purple2,
  Array = c.yellow,
  Boolean = c.orange,
  Class = c.yellow,
  Color = c.fg,
  Constant = c.orange,
  Constructor = c.blue,
  Enum = c.purple2,
  EnumMember = c.yellow,
  Event = c.yellow,
  Field = c.purple2,
  File = c.blue,
  Folder = c.orange,
  Function = c.blue,
  Interface = c.fg,
  Key = c.brown,
  Keyword = c.brown,
  Method = c.blue,
  Module = c.orange,
  Namespace = c.red,
  Null = c.bg4,
  Number = c.orange,
  Object = c.red,
  Operator = c.red,
  Package = c.yellow,
  Property = c.brown,
  Reference = c.orange,
  Snippet = c.red,
  String = c.fg,
  Struct = c.purple2,
  Text = c.fg_dim,
  TypeParameter = c.red,
  Unit = c.fg,
  Value = c.orange,
  Variable = c.purple2,
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

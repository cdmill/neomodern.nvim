local c = require("saguaro.colors")
local config = vim.g.saguaro_config
local util = require("saguaro.util")

local M = {}
local hl = { langs = {}, plugins = {} }

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

local colors = {
  Fg = { fg = c.fg },
  LightGrey = { fg = c.comment },
  Grey = { fg = c.num },
  Red = { fg = c.red },
  Orange = { fg = c.orange },
  Yellow = { fg = c.yellow },
  Green = { fg = c.green },
  Blue = { fg = c.blue },
  Pink = { fg = c.pink },
  Purple = { fg = c.purple },
  Brown = { fg = c.brown },
}
hl.common = {
  Normal = { fg = c.fg, bg = config.transparent and c.none or c.base },
  Terminal = { fg = c.fg, bg = config.transparent and c.none or c.base },
  EndOfBuffer = {
    fg = config.show_eob and c.relnum or c.base,
    bg = config.transparent and c.none or c.base,
  },
  FoldColumn = { fg = c.fg, bg = config.transparent and c.none or c.line },
  Folded = { fg = c.fg, bg = config.transparent and c.none or c.line },
  SignColumn = { fg = c.fg, bg = config.transparent and c.none or c.base },
  ToolbarLine = { fg = c.fg },
  Cursor = { fmt = "reverse" },
  vCursor = { fmt = "reverse" },
  iCursor = { fmt = "reverse" },
  lCursor = { fmt = "reverse" },
  CursorIM = { fmt = "reverse" },
  CursorColumn = { bg = c.line },
  CursorLine = { bg = c.line },
  ColorColumn = { bg = c.line },
  CursorLineNr = { fg = c.fg },
  LineNr = { fg = c.num },
  Conceal = { fg = c.num, bg = c.line },
  DiffAdd = { fg = c.none, bg = c.diff_add },
  DiffChange = { fg = c.none, bg = c.diff_change },
  DiffDelete = { fg = c.none, bg = c.diff_delete },
  DiffText = { fg = c.none, bg = c.diff_text },
  DiffAdded = colors.Green,
  DiffRemoved = colors.Red,
  DiffFile = colors.Brown,
  DiffIndexLine = colors.Grey,
  Directory = { fg = c.green },
  ErrorMsg = { fg = c.red, fmt = "bold" },
  WarningMsg = { fg = c.orange, fmt = "bold" },
  MoreMsg = { fg = c.blue, fmt = "bold" },
  CurSearch = { fg = c.base, bg = c.visual_text },
  IncSearch = { fg = c.base, bg = c.visual_text },
  Search = { fg = c.base, bg = c.visual_text },
  Substitute = { fg = c.base, bg = c.green },
  MatchParen = { fg = c.none, bg = c.orange },
  NonText = { fg = c.num },
  Whitespace = { fg = c.num },
  SpecialKey = { fg = c.num },
  Pmenu = { fg = c.fg, bg = c.line },
  PmenuSbar = { fg = c.none, bg = c.line },
  PmenuSel = { fg = c.base, bg = c.bg_blue },
  WildMenu = { fg = c.base, bg = c.blue },
  PmenuThumb = { fg = c.none, bg = c.num },
  Question = { fg = c.yellow },
  SpellBad = { fg = c.none, fmt = "undercurl", sp = c.red },
  SpellCap = { fg = c.none, fmt = "undercurl", sp = c.yellow },
  SpellLocal = { fg = c.none, fmt = "undercurl", sp = c.pink },
  SpellRare = { fg = c.none, fmt = "undercurl", sp = c.purple },
  StatusLine = { fg = c.fg, bg = c.relnum },
  StatusLineTerm = { fg = c.fg, bg = c.relnum },
  StatusLineNC = { fg = c.num, bg = c.relnum },
  StatusLineTermNC = { fg = c.num, bg = c.relnum },
  TabLine = { fg = c.fg, bg = c.line },
  TabLineFill = { fg = c.num, bg = c.line },
  TabLineSel = { fg = c.base, bg = c.fg },
  WinSeparator = { fg = c.float },
  Visual = { bg = c.float },
  VisualNOS = { fg = c.none, bg = c.relnum, fmt = "underline" },
  QuickFixLine = { fg = c.blue, fmt = "underline" },
  Debug = { fg = c.yellow },
  debugPC = { fg = c.base, bg = c.green },
  debugBreakpoint = { fg = c.base, bg = c.red },
  ToolbarButton = { fg = c.base, bg = c.bg_blue },
  FloatBorder = { fg = c.num, bg = c.line },
  NormalFloat = { fg = c.fg, bg = c.line },
}

hl.syntax = {
  String = { fg = c.green, fmt = config.code_style.strings },
  Character = colors.Orange,
  Number = colors.Orange,
  Float = colors.Orange,
  Boolean = colors.Orange,
  Type = colors.Yellow,
  Structure = colors.Yellow,
  StorageClass = colors.Yellow,
  Identifier = { fg = c.red, fmt = config.code_style.variables },
  Constant = colors.Brown,
  PreProc = colors.Purple,
  PreCondit = colors.Purple,
  Include = colors.Purple,
  Keyword = { fg = c.purple, fmt = config.code_style.keywords },
  Define = colors.Purple,
  Typedef = colors.Yellow,
  Exception = colors.Purple,
  Conditional = { fg = c.purple, fmt = config.code_style.keywords },
  Repeat = { fg = c.purple, fmt = config.code_style.keywords },
  Statement = colors.Purple,
  Macro = colors.Red,
  Error = colors.Purple,
  Label = colors.Purple,
  Special = colors.Red,
  SpecialChar = colors.Red,
  Function = { fg = c.blue, fmt = config.code_style.functions },
  Operator = colors.Purple,
  Title = colors.Brown,
  Tag = colors.Green,
  Delimiter = colors.LightGrey,
  Comment = { fg = c.num, fmt = config.code_style.comments },
  SpecialComment = { fg = c.num, fmt = config.code_style.comments },
  Todo = { fg = c.red, fmt = config.code_style.comments },
}

if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
  hl.treesitter = {
    ["@annotation"] = colors.Fg,
    ["@attribute"] = colors.Brown,
    ["@attribute.typescript"] = colors.Blue,
    ["@boolean"] = colors.Orange,
    ["@character"] = colors.Orange,
    ["@comment"] = { fg = c.num, fmt = config.code_style.comments },
    ["@conditional"] = { fg = c.purple, fmt = config.code_style.keywords },
    ["@constant"] = { fg = c.orange, fmt = config.code_style.constants },
    ["@constant.builtin"] = { fg = c.orange, fmt = config.code_style.constants },
    ["@constant.macro"] = { fg = c.orange, fmt = config.code_style.constants },
    ["@constructor"] = { fg = c.yellow, fmt = "bold" },
    ["@error"] = colors.Fg,
    ["@exception"] = colors.Purple,
    ["@field"] = colors.Brown,
    ["@float"] = colors.Orange,
    ["@function"] = { fg = c.blue, fmt = config.code_style.functions },
    ["@function.builtin"] = { fg = c.brown, fmt = config.code_style.functions },
    ["@function.macro"] = { fg = c.brown, fmt = config.code_style.functions },
    ["@include"] = colors.Purple,
    ["@keyword"] = { fg = c.purple, fmt = config.code_style.keywords },
    ["@keyword.function"] = { fg = c.purple, fmt = config.code_style.functions },
    ["@keyword.operator"] = { fg = c.purple, fmt = config.code_style.keywords },
    ["@label"] = colors.Red,
    ["@method"] = { fg = c.blue, fmt = config.code_style.functions },
    ["@namespace"] = colors.Yellow,
    ["@none"] = colors.Fg,
    ["@number"] = colors.Orange,
    ["@operator"] = colors.Fg,
    ["@parameter"] = colors.Red,
    ["@parameter.reference"] = colors.Fg,
    ["@preproc"] = colors.Purple,
    ["@property"] = colors.Brown,
    ["@punctuation.delimiter"] = colors.LightGrey,
    ["@punctuation.bracket"] = colors.LightGrey,
    ["@punctuation.special"] = colors.Red,
    ["@repeat"] = { fg = c.purple, fmt = config.code_style.keywords },
    ["@string"] = { fg = c.green, fmt = config.code_style.strings },
    ["@string.regex"] = { fg = c.orange, fmt = config.code_style.strings },
    ["@string.escape"] = { fg = c.red, fmt = config.code_style.strings },
    ["@symbol"] = colors.Brown,
    ["@tag"] = colors.Purple,
    ["@tag.attribute"] = colors.Yellow,
    ["@tag.delimiter"] = colors.Purple,
    ["@text"] = colors.Fg,
    ["@text.strong"] = { fg = c.fg, fmt = "bold" },
    ["@text.emphasis"] = { fg = c.fg, fmt = "italic" },
    ["@text.underline"] = { fg = c.fg, fmt = "underline" },
    ["@text.strike"] = { fg = c.fg, fmt = "strikethrough" },
    ["@text.title"] = { fg = c.orange, fmt = "bold" },
    ["@text.literal"] = colors.Green,
    ["@text.uri"] = { fg = c.brown, fmt = "underline" },
    ["@text.todo"] = { fg = c.red, fmt = config.code_style.comments },
    ["@text.todo.unchecked"] = { fg = c.red, fmt = config.code_style.comments },
    ["@text.todo.checked"] = { fg = c.green, fmt = config.code_style.comments },
    ["@text.math"] = colors.Fg,
    ["@text.reference"] = colors.Blue,
    ["@text.environment"] = colors.Fg,
    ["@text.environment.name"] = colors.Fg,
    ["@text.diff.add"] = colors.Green,
    ["@text.diff.delete"] = colors.Red,
    ["@note"] = colors.Fg,
    ["@warning"] = colors.Fg,
    ["@danger"] = colors.Fg,
    ["@type"] = colors.Yellow,
    ["@type.builtin"] = colors.Orange,
    ["@variable"] = { fg = c.fg, fmt = config.code_style.variables },
    ["@variable.builtin"] = { fg = c.red, fmt = config.code_style.variables },
  }
  if vim.api.nvim_call_function("has", { "nvim-0.9" }) == 1 then
    hl.lsp = {
      ["@lsp.type.comment"] = hl.treesitter["@comment"],
      ["@lsp.type.enum"] = hl.treesitter["@type"],
      ["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
      ["@lsp.type.interface"] = hl.treesitter["@type"],
      ["@lsp.type.typeParameter"] = hl.treesitter["@type"],
      ["@lsp.type.keyword"] = hl.treesitter["@keyword"],
      ["@lsp.type.namespace"] = hl.treesitter["@namespace"],
      ["@lsp.type.parameter"] = hl.treesitter["@parameter"],
      ["@lsp.type.property"] = hl.treesitter["@property"],
      ["@lsp.type.variable"] = hl.treesitter["@variable"],
      ["@lsp.type.macro"] = hl.treesitter["@function.macro"],
      ["@lsp.type.method"] = hl.treesitter["@method"],
      ["@lsp.type.number"] = hl.treesitter["@number"],
      ["@lsp.type.generic"] = hl.treesitter["@text"],
      ["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
      ["@lsp.typemod.method.defaultLibrary"] = hl.treesitter["@function"],
      ["@lsp.typemod.function.defaultLibrary"] = hl.treesitter["@function"],
      ["@lsp.typemod.operator.injected"] = hl.treesitter["@operator"],
      ["@lsp.typemod.string.injected"] = hl.treesitter["@string"],
      ["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@variable.builtin"],
      ["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
      ["@lsp.typemod.variable.static"] = hl.treesitter["@constant"],
    }
  end
else
  hl.treesitter = {
    TSAnnotation = colors.Fg,
    TSAttribute = colors.Brown,
    TSBoolean = colors.Orange,
    TSCharacter = colors.Orange,
    TSComment = { fg = c.num, fmt = config.code_style.comments },
    TSConditional = { fg = c.purple, fmt = config.code_style.keywords },
    TSConstant = colors.Orange,
    TSConstBuiltin = colors.Orange,
    TSConstMacro = colors.Orange,
    TSConstructor = { fg = c.yellow, fmt = "bold" },
    TSError = colors.Fg,
    TSException = colors.Purple,
    TSField = colors.Brown,
    TSFloat = colors.Orange,
    TSFunction = { fg = c.blue, fmt = config.code_style.functions },
    TSFuncBuiltin = { fg = c.brown, fmt = config.code_style.functions },
    TSFuncMacro = { fg = c.brown, fmt = config.code_style.functions },
    TSInclude = colors.Purple,
    TSKeyword = { fg = c.purple, fmt = config.code_style.keywords },
    TSKeywordFunction = { fg = c.purple, fmt = config.code_style.functions },
    TSKeywordOperator = { fg = c.purple, fmt = config.code_style.keywords },
    TSLabel = colors.Red,
    TSMethod = { fg = c.blue, fmt = config.code_style.functions },
    TSNamespace = colors.Yellow,
    TSNone = colors.Fg,
    TSNumber = colors.Orange,
    TSOperator = colors.Fg,
    TSParameter = colors.Red,
    TSParameterReference = colors.Fg,
    TSProperty = colors.Brown,
    TSPunctDelimiter = colors.LightGrey,
    TSPunctBracket = colors.LightGrey,
    TSPunctSpecial = colors.Red,
    TSRepeat = { fg = c.purple, fmt = config.code_style.keywords },
    TSString = { fg = c.green, fmt = config.code_style.strings },
    TSStringRegex = { fg = c.orange, fmt = config.code_style.strings },
    TSStringEscape = { fg = c.red, fmt = config.code_style.strings },
    TSSymbol = colors.Brown,
    TSTag = colors.Purple,
    TSTagDelimiter = colors.Purple,
    TSText = colors.Fg,
    TSStrong = { fg = c.fg, fmt = "bold" },
    TSEmphasis = { fg = c.fg, fmt = "italic" },
    TSUnderline = { fg = c.fg, fmt = "underline" },
    TSStrike = { fg = c.fg, fmt = "strikethrough" },
    TSTitle = { fg = c.orange, fmt = "bold" },
    TSLiteral = colors.Green,
    TSURI = { fg = c.brown, fmt = "underline" },
    TSMath = colors.Fg,
    TSTextReference = colors.Blue,
    TSEnvironment = colors.Fg,
    TSEnvironmentName = colors.Fg,
    TSNote = colors.Fg,
    TSWarning = colors.Fg,
    TSDanger = colors.Fg,
    TSType = colors.Yellow,
    TSTypeBuiltin = colors.Orange,
    TSVariable = { fg = c.fg, fmt = config.code_style.variables },
    TSVariableBuiltin = { fg = c.red, fmt = config.code_style.variables },
  }
end

-- TODO:
local diagnostics_error_color = config.diagnostics.darker and c.dark_red or c.red
local diagnostics_hint_color = config.diagnostics.darker and c.dark_purple or c.purple
local diagnostics_warn_color = config.diagnostics.darker and c.dark_yellow or c.yellow
local diagnostics_info_color = config.diagnostics.darker and c.dark_cyan or c.brown
hl.plugins.lsp = {
  LspCxxHlGroupEnumConstant = colors.Orange,
  LspCxxHlGroupMemberVariable = colors.Orange,
  LspCxxHlGroupNamespace = colors.Blue,
  LspCxxHlSkippedRegion = colors.Grey,
  LspCxxHlSkippedRegionBeginEnd = colors.Red,

  DiagnosticError = { fg = c.red },
  DiagnosticHint = { fg = c.purple },
  DiagnosticInfo = { fg = c.brown },
  DiagnosticWarn = { fg = c.yellow },

  DiagnosticVirtualTextError = {
    bg = config.diagnostics.background
        and util.darken(diagnostics_error_color, 0.1, c.base)
      or c.none,
    fg = diagnostics_error_color,
  },
  DiagnosticVirtualTextWarn = {
    bg = config.diagnostics.background
        and util.darken(diagnostics_warn_color, 0.1, c.base)
      or c.none,
    fg = diagnostics_warn_color,
  },
  DiagnosticVirtualTextInfo = {
    bg = config.diagnostics.background
        and util.darken(diagnostics_info_color, 0.1, c.base)
      or c.none,
    fg = diagnostics_info_color,
  },
  DiagnosticVirtualTextHint = {
    bg = config.diagnostics.background
        and util.darken(diagnostics_hint_color, 0.1, c.base)
      or c.none,
    fg = diagnostics_hint_color,
  },

  DiagnosticUnderlineError = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.red,
  },
  DiagnosticUnderlineHint = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.purple,
  },
  DiagnosticUnderlineInfo = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.blue,
  },
  DiagnosticUnderlineWarn = {
    fmt = config.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.yellow,
  },

  LspReferenceText = { bg = c.relnum },
  LspReferenceWrite = { bg = c.relnum },
  LspReferenceRead = { bg = c.relnum },

  LspCodeLens = { fg = c.num, fmt = config.code_style.comments },
  LspCodeLensSeparator = { fg = c.num },
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
  BufferCurrentSign = { fg = c.purple },
  BufferInactiveMod = { fg = c.comment, bg = c.line, fmt = "italic" },
  BufferVisible = { fg = c.comment, bg = c.base },
  BufferVisibleMod = { fg = c.yellow, bg = c.base, fmt = "italic" },
  BufferVisibleIndex = { fg = c.comment, bg = c.base },
  BufferVisibleSign = { fg = c.comment, bg = c.base },
  BufferVisibleTarget = { fg = c.comment, bg = c.base },
}

hl.plugins.cmp = {
  CmpItemAbbr = colors.Fg,
  CmpItemAbbrDeprecated = { fg = c.comment, fmt = "strikethrough" },
  CmpItemAbbrMatch = colors.Brown,
  CmpItemAbbrMatchFuzzy = { fg = c.brown, fmt = "underline" },
  CmpItemMenu = colors.LightGrey,
  CmpItemKind = { fg = c.purple, fmt = config.cmp_itemkind_reverse and "reverse" },
}

hl.plugins.coc = {
  CocErrorSign = hl.plugins.lsp.DiagnosticError,
  CocHintSign = hl.plugins.lsp.DiagnosticHint,
  CocInfoSign = hl.plugins.lsp.DiagnosticInfo,
  CocWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.whichkey = {
  WhichKey = colors.Red,
  WhichKeyDesc = colors.Blue,
  WhichKeyGroup = colors.Orange,
  WhichKeySeparator = colors.Green,
}

hl.plugins.gitgutter = {
  GitGutterAdd = { fg = c.green },
  GitGutterChange = { fg = c.blue },
  GitGutterDelete = { fg = c.red },
}

hl.plugins.hop = {
  HopNextKey = { fg = c.red, fmt = "bold" },
  HopNextKey1 = { fg = c.brown, fmt = "bold" },
  HopNextKey2 = { fg = util.darken(c.blue, 0.7) },
  HopUnmatched = colors.Grey,
}

-- comment
hl.plugins.diffview = {
  DiffviewFilePanelTitle = { fg = c.blue, fmt = "bold" },
  DiffviewFilePanelCounter = { fg = c.purple, fmt = "bold" },
  DiffviewFilePanelFileName = colors.Fg,
  DiffviewNormal = hl.common.Normal,
  DiffviewCursorLine = hl.common.CursorLine,
  DiffviewVertSplit = hl.common.VertSplit,
  DiffviewSignColumn = hl.common.SignColumn,
  DiffviewStatusLine = hl.common.StatusLine,
  DiffviewStatusLineNC = hl.common.StatusLineNC,
  DiffviewEndOfBuffer = hl.common.EndOfBuffer,
  DiffviewFilePanelRootPath = colors.Grey,
  DiffviewFilePanelPath = colors.Grey,
  DiffviewFilePanelInsertions = colors.Green,
  DiffviewFilePanelDeletions = colors.Red,
  DiffviewStatusAdded = colors.Green,
  DiffviewStatusUntracked = colors.Blue,
  DiffviewStatusModified = colors.Blue,
  DiffviewStatusRenamed = colors.Blue,
  DiffviewStatusCopied = colors.Blue,
  DiffviewStatusTypeChange = colors.Blue,
  DiffviewStatusUnmerged = colors.Blue,
  DiffviewStatusUnknown = colors.Red,
  DiffviewStatusDeleted = colors.Red,
  DiffviewStatusBroken = colors.Red,
}

hl.plugins.gitsigns = {
  GitSignsAdd = colors.Green,
  GitSignsAddLn = colors.Green,
  GitSignsAddNr = colors.Green,
  GitSignsChange = colors.Blue,
  GitSignsChangeLn = colors.Blue,
  GitSignsChangeNr = colors.Blue,
  GitSignsDelete = colors.Red,
  GitSignsDeleteLn = colors.Red,
  GitSignsDeleteNr = colors.Red,
}

hl.plugins.neo_tree = {
  NeoTreeNormal = { fg = c.fg, bg = config.transparent and c.none or c.float },
  NeoTreeNormalNC = { fg = c.fg, bg = config.transparent and c.none or c.float },
  NeoTreeVertSplit = { fg = c.line, bg = config.transparent and c.none or c.line },
  NeoTreeWinSeparator = { fg = c.line, bg = config.transparent and c.none or c.line },
  NeoTreeEndOfBuffer = {
    fg = config.show_eob and c.relnum or c.float,
    bg = config.transparent and c.none or c.float,
  },
  NeoTreeRootName = { fg = c.orange, fmt = "bold" },
  NeoTreeGitAdded = colors.Green,
  NeoTreeGitDeleted = colors.Red,
  NeoTreeGitModified = colors.Yellow,
  NeoTreeGitConflict = { fg = c.red, fmt = "bold,italic" },
  NeoTreeGitUntracked = { fg = c.red, fmt = "italic" },
  NeoTreeIndentMarker = colors.Grey,
  NeoTreeSymbolicLinkTarget = colors.Purple,
}

hl.plugins.neotest = {
  NeotestAdapterName = { fg = c.purple, fmt = "bold" },
  NeotestDir = colors.Brown,
  NeotestExpandMarker = colors.Grey,
  NeotestFailed = colors.Red,
  NeotestFile = colors.Brown,
  NeotestFocused = { fmt = "bold,italic" },
  NeotestIndent = colors.Grey,
  NeotestMarked = { fg = c.orange, fmt = "bold" },
  NeotestNamespace = colors.Blue,
  NeotestPassed = colors.Green,
  NeotestRunning = colors.Yellow,
  NeotestWinSelect = { fg = c.brown, fmt = "bold" },
  NeotestSkipped = colors.LightGrey,
  NeotestTarget = colors.Purple,
  NeotestTest = colors.Fg,
  NeotestUnknown = colors.LightGrey,
}

hl.plugins.nvim_tree = {
  NvimTreeNormal = { fg = c.fg, bg = config.transparent and c.none or c.float },
  NvimTreeVertSplit = { fg = c.float, bg = config.transparent and c.none or c.float },
  NvimTreeEndOfBuffer = {
    fg = config.show_eob and c.relnum or c.float,
    bg = config.transparent and c.none or c.float,
  },
  NvimTreeRootFolder = { fg = c.orange, fmt = "bold" },
  NvimTreeGitDirty = colors.Yellow,
  NvimTreeGitNew = colors.Green,
  NvimTreeGitDeleted = colors.Red,
  NvimTreeSpecialFile = { fg = c.yellow, fmt = "underline" },
  NvimTreeIndentMarker = colors.Fg,
  -- TODO:
  -- NvimTreeImageFile = { fg = c.dark_purple },
  NvimTreeSymlink = colors.Purple,
  NvimTreeFolderName = colors.Blue,
}
hl.plugins.telescope = {
  TelescopeBorder = colors.Red,
  TelescopePromptBorder = colors.Brown,
  TelescopeResultsBorder = colors.Brown,
  TelescopePreviewBorder = colors.Brown,
  TelescopeMatching = { fg = c.orange, fmt = "bold" },
  TelescopePromptPrefix = colors.Green,
  TelescopeSelection = { bg = c.relnum },
  TelescopeSelectionCaret = colors.Yellow,
}

hl.plugins.dashboard = {
  DashboardShortCut = colors.Blue,
  DashboardHeader = colors.Yellow,
  DashboardCenter = colors.Brown,
  -- TODO:
  -- DashboardFooter = { fg = c.dark_red, fmt = "italic" },
}

hl.plugins.outline = {
  FocusedSymbol = { fg = c.purple, bg = c.relnum, fmt = "bold" },
  AerialLine = { fg = c.purple, bg = c.relnum, fmt = "bold" },
}

hl.plugins.navic = {
  NavicText = { fg = c.fg },
  NavicSeparator = { fg = c.comment },
}

hl.plugins.ts_rainbow = {
  rainbowcol1 = colors.LightGrey,
  rainbowcol2 = colors.Yellow,
  rainbowcol3 = colors.Blue,
  rainbowcol4 = colors.Orange,
  rainbowcol5 = colors.Purple,
  rainbowcol6 = colors.Green,
  rainbowcol7 = colors.Red,
}

hl.plugins.ts_rainbow2 = {
  TSRainbowRed = colors.Red,
  TSRainbowYellow = colors.Yellow,
  TSRainbowBlue = colors.Blue,
  TSRainbowOrange = colors.Orange,
  TSRainbowGreen = colors.Green,
  TSRainbowViolet = colors.Purple,
  TSRainbowBrown = colors.Brown,
}

hl.plugins.rainbow_delimiters = {
  RainbowDelimiterRed = colors.Red,
  RainbowDelimiterYellow = colors.Yellow,
  RainbowDelimiterBlue = colors.Blue,
  RainbowDelimiterOrange = colors.Orange,
  RainbowDelimiterGreen = colors.Green,
  RainbowDelimiterViolet = colors.Purple,
  RainbowDelimiterBrown = colors.Brown,
}

hl.plugins.indent_blankline = {
  IndentBlanklineIndent1 = colors.Blue,
  IndentBlanklineIndent2 = colors.Green,
  IndentBlanklineIndent3 = colors.Brown,
  IndentBlanklineIndent4 = colors.LightGrey,
  IndentBlanklineIndent5 = colors.Purple,
  IndentBlanklineIndent6 = colors.Red,
  IndentBlanklineChar = { fg = c.line, fmt = "nocombine" },
  IndentBlanklineContextChar = { fg = c.num, fmt = "nocombine" },
  IndentBlanklineContextStart = { sp = c.num, fmt = "underline" },
  IndentBlanklineContextSpaceChar = { fmt = "nocombine" },

  -- Ibl v3
  IblIndent = { fg = c.line, fmt = "nocombine" },
  IblWhitespace = { fg = c.num, fmt = "nocombine" },
  IblScope = { fg = c.num, fmt = "nocombine" },
}

hl.plugins.mini = {
  MiniCompletionActiveParameter = { fmt = "underline" },

  MiniCursorword = { fmt = "underline" },
  MiniCursorwordCurrent = { fmt = "underline" },

  MiniIndentscopeSymbol = { fg = c.num },
  MiniIndentscopePrefix = { fmt = "nocombine" }, -- Make it invisible

  MiniJump = { fg = c.purple, fmt = "underline", sp = c.purple },

  MiniJump2dSpot = { fg = c.red, fmt = "bold,nocombine" },

  MiniStarterCurrent = { fmt = "nocombine" },
  -- TODO:
  -- MiniStarterFooter = { fg = c.dark_red, fmt = "italic" },
  MiniStarterHeader = colors.Yellow,
  MiniStarterInactive = { fg = c.num, fmt = config.code_style.comments },
  MiniStarterItem = { fg = c.fg, bg = config.transparent and c.none or c.base },
  MiniStarterItemBullet = { fg = c.num },
  MiniStarterItemPrefix = { fg = c.yellow },
  MiniStarterSection = colors.LightGrey,
  MiniStarterQuery = { fg = c.brown },

  MiniStatuslineDevinfo = { fg = c.fg, bg = c.relnum },
  MiniStatuslineFileinfo = { fg = c.fg, bg = c.relnum },
  MiniStatuslineFilename = { fg = c.num, bg = c.line },
  MiniStatuslineInactive = { fg = c.num, bg = c.base },
  MiniStatuslineModeCommand = { fg = c.base, bg = c.yellow, fmt = "bold" },
  MiniStatuslineModeInsert = { fg = c.base, bg = c.blue, fmt = "bold" },
  MiniStatuslineModeNormal = { fg = c.base, bg = c.green, fmt = "bold" },
  MiniStatuslineModeOther = { fg = c.base, bg = c.brown, fmt = "bold" },
  MiniStatuslineModeReplace = { fg = c.base, bg = c.red, fmt = "bold" },
  MiniStatuslineModeVisual = { fg = c.base, bg = c.purple, fmt = "bold" },

  MiniSurround = { fg = c.base, bg = c.orange },

  MiniTablineCurrent = { fmt = "bold" },
  MiniTablineFill = { fg = c.num, bg = c.line },
  MiniTablineHidden = { fg = c.fg, bg = c.line },
  MiniTablineModifiedCurrent = { fg = c.orange, fmt = "bold,italic" },
  MiniTablineModifiedHidden = { fg = c.comment, bg = c.line, fmt = "italic" },
  MiniTablineModifiedVisible = { fg = c.yellow, bg = c.base, fmt = "italic" },
  -- TODO:
  -- MiniTablineTabpagesection = { fg = c.base, bg = c.bg_yellow },
  MiniTablineVisible = { fg = c.comment, bg = c.base },

  MiniTestEmphasis = { fmt = "bold" },
  MiniTestFail = { fg = c.red, fmt = "bold" },
  MiniTestPass = { fg = c.green, fmt = "bold" },

  MiniTrailspace = { bg = c.red },
}

hl.langs.c = {
  cInclude = colors.Blue,
  cStorageClass = colors.Purple,
  cTypedef = colors.Purple,
  cDefine = colors.Brown,
  cTSInclude = colors.Blue,
  cTSConstant = colors.Brown,
  cTSConstMacro = colors.Purple,
  cTSOperator = colors.Purple,
}

hl.langs.cpp = {
  cppStatement = { fg = c.purple, fmt = "bold" },
  cppTSInclude = colors.Blue,
  cppTSConstant = colors.Brown,
  cppTSConstMacro = colors.Purple,
  cppTSOperator = colors.Purple,
}

hl.langs.markdown = {
  markdownBlockquote = colors.Grey,
  markdownBold = { fg = c.none, fmt = "bold" },
  markdownBoldDelimiter = colors.Grey,
  markdownCode = colors.Green,
  markdownCodeBlock = colors.Green,
  markdownCodeDelimiter = colors.Yellow,
  markdownH1 = { fg = c.red, fmt = "bold" },
  markdownH2 = { fg = c.purple, fmt = "bold" },
  markdownH3 = { fg = c.orange, fmt = "bold" },
  markdownH4 = { fg = c.red, fmt = "bold" },
  markdownH5 = { fg = c.purple, fmt = "bold" },
  markdownH6 = { fg = c.orange, fmt = "bold" },
  markdownHeadingDelimiter = colors.Grey,
  markdownHeadingRule = colors.Grey,
  markdownId = colors.Yellow,
  markdownIdDeclaration = colors.Red,
  markdownItalic = { fg = c.none, fmt = "italic" },
  markdownItalicDelimiter = { fg = c.num, fmt = "italic" },
  markdownLinkDelimiter = colors.Grey,
  markdownLinkText = colors.Red,
  markdownLinkTextDelimiter = colors.Grey,
  markdownListMarker = colors.Red,
  markdownOrderedListMarker = colors.Red,
  markdownRule = colors.Purple,
  markdownUrl = { fg = c.blue, fmt = "underline" },
  markdownUrlDelimiter = colors.Grey,
  markdownUrlTitleDelimiter = colors.Green,
}

hl.langs.php = {
  phpFunctions = { fg = c.fg, fmt = config.code_style.functions },
  phpMethods = colors.Brown,
  phpStructure = colors.Purple,
  phpOperator = colors.Purple,
  phpMemberSelector = colors.Fg,
  phpVarSelector = { fg = c.orange, fmt = config.code_style.variables },
  phpIdentifier = { fg = c.orange, fmt = config.code_style.variables },
  phpBoolean = colors.Brown,
  phpNumber = colors.Orange,
  phpHereDoc = colors.Green,
  phpNowDoc = colors.Green,
  phpSCKeyword = { fg = c.purple, fmt = config.code_style.keywords },
  phpFCKeyword = { fg = c.purple, fmt = config.code_style.keywords },
  phpRegion = colors.Blue,
}

hl.langs.scala = {
  scalaNameDefinition = colors.Fg,
  scalaInterpolationBoundary = colors.Purple,
  scalaInterpolation = colors.Purple,
  scalaTypeOperator = colors.Red,
  scalaOperator = colors.Red,
  scalaKeywordModifier = { fg = c.red, fmt = config.code_style.keywords },
}

hl.langs.tex = {
  latexTSInclude = colors.Blue,
  latexTSFuncMacro = { fg = c.fg, fmt = config.code_style.functions },
  latexTSEnvironment = { fg = c.brown, fmt = "bold" },
  latexTSEnvironmentName = colors.Yellow,
  texCmdEnv = colors.Brown,
  texEnvArgName = colors.Yellow,
  latexTSTitle = colors.Green,
  latexTSType = colors.Blue,
  latexTSMath = colors.Orange,
  texMathZoneX = colors.Orange,
  texMathZoneXX = colors.Orange,
  texMathDelimZone = colors.LightGrey,
  texMathDelim = colors.Purple,
  texMathOper = colors.Red,
  texCmd = colors.Purple,
  texCmdPart = colors.Blue,
  texCmdPackage = colors.Blue,
  texPgfType = colors.Yellow,
}

hl.langs.vim = {
  vimOption = colors.Red,
  vimSetEqual = colors.Yellow,
  vimMap = colors.Purple,
  vimMapModKey = colors.Orange,
  vimNotation = colors.Red,
  vimMapLhs = colors.Fg,
  vimMapRhs = colors.Blue,
  vimVar = { fg = c.fg, fmt = config.code_style.variables },
  vimCommentTitle = { fg = c.comment, fmt = config.code_style.comments },
}

local lsp_kind_icons_color = {
  Default = c.purple,
  Array = c.yellow,
  Boolean = c.orange,
  Class = c.yellow,
  Color = c.green,
  Constant = c.orange,
  Constructor = c.blue,
  Enum = c.purple,
  EnumMember = c.yellow,
  Event = c.yellow,
  Field = c.purple,
  File = c.blue,
  Folder = c.orange,
  Function = c.blue,
  Interface = c.green,
  Key = c.brown,
  Keyword = c.brown,
  Method = c.blue,
  Module = c.orange,
  Namespace = c.red,
  Null = c.num,
  Number = c.orange,
  Object = c.red,
  Operator = c.red,
  Package = c.yellow,
  Property = c.brown,
  Reference = c.orange,
  Snippet = c.red,
  String = c.green,
  Struct = c.purple,
  Text = c.comment,
  TypeParameter = c.red,
  Unit = c.green,
  Value = c.orange,
  Variable = c.purple,
}

function M.setup()
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
  for _, group in pairs(hl.langs) do
    vim_highlights(group)
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

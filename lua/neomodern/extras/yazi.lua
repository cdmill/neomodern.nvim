local util = require("neomodern.util")

local M = {}

function M.generate(colors)
  local yazi = util.template(
    [[
  # Theme: ${_name}
  # URL: ${_upstream_url}

  [manager]
  cwd = { fg = "${func}" }

  hovered         = { fg = "${property}", bg = "${line}" }
  preview_hovered = { fg = "${property}", bg = "${line}" }

  find_keyword  = { fg = "${alt}", italic = true }
  find_position = { fg = "${alt}", bg = "reset", italic = true }

  marker_copied   = { fg = "${string}" }
  marker_cut      = { fg = "${error}" }
  marker_selected = { fg = "${alt}" }

  tab_active   = { fg = "${alt}", bg = "${visual}" }
  tab_inactive = { fg = "${comment}", bg = "${visual}" }
  tab_width    = 1

  count_cut      = { fg = "${builtin}", bg = "${line}" }
  count_copied   = { fg = "${builtin}", bg = "${line}" }
  count_selected = { fg = "${builtin}", bg = "${line}" }

  border_symbol = "│"
  border_style  = { fg = "${comment}" }

  [status]
  separator_open  = ""
  separator_close = ""
  separator_style = { fg = "${visual}", bg = "${visual}" }

  mode_normal = { fg = "${bg}", bg = "${blue}", bold = true }
  mode_select = { fg = "${bg}", bg = "${purple}", bold = true }
  mode_unset  = { fg = "${bg}", bg = "${cyan}", bold = true }

  progress_label  = { fg = "${alt}", bold = true }
  progress_normal = { fg = "${alt}", bg = "${visual}" }
  progress_error  = { fg = "${bg}", bg = "${error}" }

  permissions_t = { fg = "${fg}" }
  permissions_r = { fg = "${yellow}" }
  permissions_w = { fg = "${red}" }
  permissions_x = { fg = "${blue}" }
  permissions_s = { fg = "${operator}" }

  [input]
  border   = { fg = "${comment}" }
  title    = {}
  value    = {}
  selected = { reversed = true }

  [select]
  border   = { fg = "${comment}" }
  active   = { fg = "${keyword}" }
  inactive = {}

  [tasks]
  border  = { fg = "${comment}" }
  title   = {}
  hovered = { underline = true }

  [which]
  mask            = { bg = "${dim}" }
  cand            = { fg = "${property}" }
  rest            = { fg = "${type}" }
  desc            = { fg = "${string}" }
  separator       = "  "
  separator_style = { fg = "${operator}"}

  [help]
  on      = { fg = "${type}" }
  run    = { fg = "${string}" }
  desc    = { fg = "${comment}" }
  hovered = { fg = "${property}", bg = "${line}", bold = true }
  footer  = { fg = "${comment}", bg = "${line}" }

  [filetype]
  rules = [
    # Media
    { mime = "image/*", fg = "${magenta}"},
    { mime = "{audio,video}/*", fg = "${string}"},

    # Archives
    { mime = "application/{,g}zip", fg = "${red}"},
    { mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}", fg = "${red}"},

    # Fallback
    { name = "*", fg = "${fg}"},
    { name = "*/", fg = "${func}"}
  ]
  ]],
    colors
  )
  return yazi
end

return M

local util = require("neomodern.util")
local palette = require("neomodern.palette")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  local yazi_colors = {}
  for k, v in pairs(colors) do
    yazi_colors[k] = v
  end
  for k, v in pairs(palette[vim.g.neomodern_config.theme]) do
    yazi_colors[k] = v
  end

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

  marker_copied   = { fg = "${alt}" }
  marker_cut      = { fg = "${error}" }
  marker_selected = { fg = "${alt}", bg = "${visual}" }

  tab_active   = { fg = "${alt}", bg = "${visual}" }
  tab_inactive = { fg = "${comment}", bg = "${visual}" }
  tab_width    = 1

  count_cut      = { fg = "${alt}", bg = "${line}" }
  count_copied   = { fg = "${alt}", bg = "${line}" }
  count_selected = { fg = "${alt}", bg = "${line}" }

  border_symbol = "│"
  border_style  = { fg = "${comment}" }

  [status]
  separator_open  = ""
  separator_close = ""
  separator_style = { fg = "${bg}", bg = "${blue}" }

  mode_normal = { fg = "${bg}", bg = "${blue}", bold = true }
  mode_select = { fg = "${bg}", bg = "${purple}", bold = true }
  mode_unset  = { fg = "${bg}", bg = "${cyan}", bold = true }

  progress_label  = { fg = "${alt}", bold = true }
  progress_normal = { fg = "${alt}", bg = "${selection}" }
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
  mask            = { bg = "${keyword}" }
  cand            = { fg = "${property}" }
  rest            = { fg = "${type}" }
  desc            = { fg = "${string}" }
  separator       = "  "
  separator_style = { fg = "${operator}"}

  [help]
  on      = { fg = "${builtin}" }
  exec    = { fg = "${type}" }
  desc    = { fg = "${string}" }
  hovered = { bg = "${property}", bold = true }
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
    yazi_colors
  )
  return yazi
end

return M

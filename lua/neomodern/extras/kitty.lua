-- CREDIT: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/extra/kitty.lua

local util = require("neomodern.util")

local M = {}

function M.generate(colors)
  local kitty = util.template(
    [[
# vim:ft=kitty

## name: ${_style_name}
## license: MIT
## author: Casey Miller
## upstream: ${_upstream_url}


background ${bg}
foreground ${fg}
selection_background ${visual}
selection_foreground ${fg}
url_color ${blue}
cursor ${fg}
cursor_text_color ${bg}

# Tabs
active_tab_background ${visual}
active_tab_foreground ${alt}
inactive_tab_background ${line}
inactive_tab_foreground ${grey}
#tab_bar_background ${bg}

# Windows
active_border_color ${alt}
inactive_border_color ${comment}

# normal
color0 ${black}
color1 ${red}
color2 ${green}
color3 ${yellow}
color4 ${blue}
color5 ${purple}
color6 ${cyan}
color7 ${fg}

# bright
color8 ${grey}
color9 ${red}
color10 ${green}
color11 ${yellow}
color12 ${blue}
color13 ${magenta}
color14 ${cyan}
color15 ${fg}

# extended colors
color16 ${orange}
color17 ${alt}
]],
    colors
  )
  return kitty
end

return M

local Util = require("neomodern.util")

local M = {}

function M.generate(colors, info)
    colors.extra = info.extra
    colors.url = info.url
    colors.upstream = info.upstream
    colors.theme = info.theme
    local kitty = Util.template(
        [=[
# vim:ft=kitty

# name: ${theme} colors for ${extra}
# url: ${url}
# upstream: ${upstream}
# author: Casey Miller

background ${bg}
# alternate, darker background ${alt_bg}
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
color0 ${c00}
color1 ${c01}
color2 ${c02}
color3 ${c03}
color4 ${c04}
color5 ${c05}
color6 ${c06}
color7 ${c07}

# bright
color8 ${c08}
color9 ${c09}
color10 ${c0A}
color11 ${c0B}
color12 ${c0C}
color13 ${c0D}
color14 ${c0E}
color15 ${c0F}

# extended colors
color16 ${alt_bg}
color17 ${alt}
]=],
        colors
    )
    return kitty
end

return M

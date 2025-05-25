local M = {}
local Util = require("neomodern.util")

function M.generate(colors, info)
    colors.extra = info.extra
    colors.url = info.url
    colors.upstream = info.upstream
    colors.theme = info.theme
    local alacritty = Util.template(
        [=[
# name: ${theme} colors for ${extra}
# url: ${url}
# upstream: ${upstream}
# author: Casey Miller

# Default colors
[colors.primary]
background = '${bg}'
# alternate, darker background = '${alt_bg}'
foreground = '${fg}'

#[colors.cursor]
#cursor = '${fg}'
#text = '${bg}'

# Normal colors
[colors.normal]
black = '${c00}'
red = '${c01}'
green = '${c02}'
yellow = '${c03}'
blue = '${c04}'
magenta = '${c05}'
cyan = '${c06}'
white = '${c07}'

# Bright colors
[colors.bright]
black = '${c08}'
red = '${c09}'
green = '${c0A}'
yellow = '${c0B}'
blue = '${c0C}'
magenta = '${c0D}'
cyan = '${c0E}'
white = '${c0F}'

# Indexed Colors
[[colors.indexed_colors]]
index = 16
color = '${alt_bg}'

[[colors.indexed_colors]]
index = 17
color = '${alt}'
]=],
        colors
    )

    return alacritty
end

return M

local M = {}
local util = require("neomodern.util")

function M.generate(colors, url, theme)
    colors.url = url
    colors.theme = theme
    local alacritty = util.template(
        [=[
# name: ${theme}
# upstream: ${url}
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
black = '${black}'
red = '${red}'
green = '${green}'
yellow = '${yellow}'
blue = '${blue}'
magenta = '${purple}'
cyan = '${cyan}'
white = '${white}'

# Bright colors
[colors.bright]
black = '${grey}'
red = '${red}'
green = '${green}'
yellow = '${yellow}'
blue = '${blue}'
magenta = '${magenta}'
cyan = '${cyan}'
white = '${white}'

# Indexed Colors
[[colors.indexed_colors]]
index = 16
color = '${orange}'

[[colors.indexed_colors]]
index = 17
color = '${alt}'
]=],
        colors
    )

    return alacritty
end

return M

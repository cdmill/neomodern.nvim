-- CREDIT: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/extra/alacritty.lua

local M = {}
local util = require("neomodern.util")

---@param colors ColorScheme
function M.generate(colors)
    local alacritty = util.template(
        [=[
# ${_style_name} Alacritty Colors
# Default colors
[colors.primary]
background = '${bg}'
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

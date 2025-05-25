local Util = require("neomodern.util")

local M = {}

function M.generate(colors, _)
    local windows_terminal = Util.template(
        [=[
# Add the following object to your Windows Terminal configuration
# https://learn.microsoft.com/en-us/windows/terminal/customize-settings/color-schemes#creating-your-own-color-scheme
{
    "background": "${bg}", // alternate, darker background=${alt_bg}
    "black": "${c00}",
    "red": "${c01}",
    "green": "${c02}",
    "yellow": "${c03}"
    "blue": "${c04}",
    "purple": "${c05}",
    "cyan": "${c06}",
    "white": "${c07}",
    "brightBlack": "${c08}",
    "brightRed": "${c09}",
    "brightGreen": "${c0A}",
    "brightYellow": "${c0B}",
    "brightBlue": "${c0C}",
    "brightPurple": "${c0D}",
    "brightCyan": "${c0E}",
    "brightWhite": "${c0F}",

    "foreground": "${c07}",
    "selectionBackground": "${visual}",
    "cursorColor": "${fg}",

    "name": "${theme}",
}
]=],
        colors
    )

    return windows_terminal
end

return M

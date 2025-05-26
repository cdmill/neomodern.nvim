local Util = require("neomodern.util")

local M = {}

function M.generate(colors, info)
    colors.extra = info.extra
    colors.url = info.url
    colors.upstream = info.upstream
    colors.theme = info.theme
    colors.theme = info.theme
    colors.theme_lower = string.lower(info.theme)
    local wezterm = Util.template(
        [=[
[colors]
foreground = "${fg}"
background = "${bg}"
# background = "${alt_bg}" # alternate, darker bg
cursor_bg = "${fg}"
cursor_border = "${comment}"
cursor_fg = "${bg}"
selection_bg = "${visual}"
selection_fg = "${type}"
split = "${comment}"
compose_cursor = "${alt}"
scrollbar_thumb = "${line}"

ansi = ["${c00}", "${c01}", "${c02}", "${c03}", "${c04}", "${c05}", "${c06}", "${c07}"]
brights = ["${c08}", "${c09}", "${c0A}", "${c0B}", "${c0C}", "${c0D}", "${c0E}", "${c0F}"]

[colors.tab_bar]
inactive_tab_edge = "${c07}"
background = "${bg}"

[colors.tab_bar.active_tab]
fg_color = "${alt}"
bg_color = "${visual}"

[colors.tab_bar.inactive_tab]
fg_color = "${comment}"
bg_color = "${line}"

[colors.tab_bar.inactive_tab_hover]
fg_color = "${comment}"
bg_color = "${line}"
# intensity = "Bold"

[colors.tab_bar.new_tab_hover]
fg_color = "${alt}"
bg_color = "${visual}"
intensity = "Bold"

[colors.tab_bar.new_tab]
fg_color = "${alt}"
bg_color = "${bg}"

[metadata]
aliases = []
name = "${theme_lower}"
url = "${url}"
upstream = "${upstream}"
author = "Casey Miller"
]=],
        colors
    )
    return wezterm
end

return M

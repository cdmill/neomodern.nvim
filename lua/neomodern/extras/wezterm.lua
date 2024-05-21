-- CREDIT: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/extra/wezterm.lua

local util = require("neomodern.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  local wezterm = util.template(
    [[
[colors]
foreground = "${fg}"
background = "${bg}"
cursor_bg = "${fg}"
cursor_border = "${fg}"
cursor_fg = "${bg}"
selection_bg = "${selection}"
selection_fg = "${fg}"
split = "${grey}"
compose_cursor = "${orange}"
scrollbar_thumb = "${grey}"

ansi = ["${black}", "${red}", "${green}", "${yellow}", "${blue}", "${purple}", "${cyan}", "${fg}"]
brights = ["${grey}", "${red}", "${green}", "${yellow}", "${blue}", "${magenta}", "${cyan}", "${fg}"]

[colors.tab_bar]
inactive_tab_edge = "${grey}"
background = "${bg}"

[colors.tab_bar.active_tab]
fg_color = "${alt}"
bg_color = "${selection}"

[colors.tab_bar.inactive_tab]
fg_color = "${comment}"
bg_color = "${inactive}"

[colors.tab_bar.inactive_tab_hover]
fg_color = "${comment}"
bg_color = "${inactive}"
# intensity = "Bold"

[colors.tab_bar.new_tab_hover]
fg_color = "${alt}"
bg_color = "${selection}"
intensity = "Bold"

[colors.tab_bar.new_tab]
fg_color = "${alt}"
bg_color = "${bg}"

[metadata]
aliases = []
author = "Casey Miller"
name = "${_name}"]],
    colors
  )
  return wezterm
end

return M

-- CREDIT: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/extra/wezterm.lua

local util = require("neomodern.util")

local M = {}

function M.generate(colors)
  local wezterm = util.template(
    [[
[colors]
foreground = "${fg}"
background = "${bg}"
cursor_bg = "${fg}"
cursor_border = "${fg}"
cursor_fg = "${bg}"
selection_bg = "${visual}"
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
author = "Casey Miller"
name = "${_name}"]],
    colors
  )
  return wezterm
end

return M

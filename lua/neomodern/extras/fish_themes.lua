-- CREDIT: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/extra/fish_themes.lua

local util = require("neomodern.util")
local palette = require("neomodern.palette")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  local fishColors = {}
  for k, v in pairs(colors) do
    if type(v) == "string" then
      fishColors[k] = v:gsub("^#", "")
    end
  end
  local fishPalette = {}
  for k, v in pairs(palette[vim.g.neomodern_config.style]) do
    if type(v) == "string" then
      fishPalette[k] = v:gsub("^#", "")
    end
  end

  for k, v in pairs(fishPalette) do
    fishColors[k] = v
  end

  local fish = util.template(
    [[
    # Syntax Highlighting Colors
    set -g fish_color_normal ${fg}
    set -g fish_color_command ${property}
    set -g fish_color_keyword ${keyword}
    set -g fish_color_quote ${string}
    set -g fish_color_redirection ${fg}
    set -g fish_color_end ${keyword}
    set -g fish_color_error ${error}
    set -g fish_color_param ${fg}
    set -g fish_color_comment ${comment}
    set -g fish_color_selection --background=${visual}
    set -g fish_color_search_match --background=${visual}
    set -g fish_color_operator ${operator}
    set -g fish_color_escape ${keyword}
    set -g fish_color_autosuggestion ${comment}

    # Completion Pager Colors}
    set -g fish_pager_color_progress ${comment}
    set -g fish_pager_color_prefix ${property}
    set -g fish_pager_color_completion ${fg}
    set -g fish_pager_color_description ${comment}
    set -g fish_pager_color_selected_background --background=${visual}

  ]],
    fishColors
  )

  return fish
end

return M

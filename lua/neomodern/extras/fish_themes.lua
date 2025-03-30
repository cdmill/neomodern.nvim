local util = require("neomodern.util")

local M = {}

function M.generate(colors, url, theme)
    colors.url = url
    colors.theme = theme
    local fish_colors = {}
    for k, v in pairs(colors) do
        if type(v) == "string" then
            fish_colors[k] = v:gsub("^#", "")
        end
    end

    local fish = util.template(
        [=[
# name: ${theme}
# upstream: ${url}
# author: Casey Miller

# preferred_background: ${bg}

set -g fish_color_normal ${fg}
set -g fish_color_command ${keyword}
set -g fish_color_keyword ${keyword}
set -g fish_color_quote ${string}
set -g fish_color_redirection ${builtin}
set -g fish_color_end ${keyword}
set -g fish_color_error ${diag_red}
set -g fish_color_param ${fg}
set -g fish_color_comment ${comment}
set -g fish_color_selection --background=${visual}
set -g fish_color_search_match --background=${visual}
set -g fish_color_operator ${operator}
set -g fish_color_escape ${func}
set -g fish_color_autosuggestion ${comment}

set -g fish_pager_color_progress ${comment}
set -g fish_pager_color_prefix ${property}
set -g fish_pager_color_completion ${fg}
set -g fish_pager_color_description ${comment}
set -g fish_pager_color_selected_background --background=${visual}
]=],
        fish_colors
    )

    return fish
end

return M

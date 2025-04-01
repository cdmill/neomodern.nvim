local util = require("neomodern.util")

local M = {}

function M.generate(colors, info)
    colors.extra = info.extra
    colors.url = info.url
    colors.upstream = info.upsteam
    colors.theme = info.theme
    local fish_colors = {}
    for k, v in pairs(colors) do
        if type(v) == "string" then
            fish_colors[k] = v:gsub("^#", "")
        end
    end

    -- TODO: add more global colors
    local fish = util.template(
        [=[
# name: ${theme} colors for ${extra}
# url: ${url}
# upstream: ${upstream}
# author: Casey Miller

# use in ~/.config/fish/conf.d/

# preferred bg: ${bg}
# alt background: ${bg}

### Full palette. 
### Colors defined in neomdern/palette/${theme}.lua
set -g alt ${alt} 
set -g constant ${constant} 
set -g comment ${comment} 
set -g fg ${fg} 
set -g func ${func} 
set -g keyword ${keyword} 
set -g number ${number} 
set -g operator ${operator} 
set -g property ${property} 
set -g str ${string} 
set -g type ${type} 

# Syntax Highlighting Colors
set -g fish_color_normal ${fg}
set -g fish_color_command ${func}
set -g fish_color_keyword ${keyword}
set -g fish_color_quote ${string}
set -g fish_color_redirection ${constant}
set -g fish_color_end ${operator}
set -g fish_color_error ${diag_red}
set -g fish_color_param ${fg}
set -g fish_color_valid_path ${type}
set -g fish_color_option ${alt}
set -g fish_color_comment ${comment}
set -g fish_color_selection --background=${line}
set -g fish_color_operator ${operator}
set -g fish_color_escape ${keyword}
set -g fish_color_autosuggestion ${comment}
set -g fish_color_cwd ${string}
set -g fish_color_hostname ${number}
set -g fish_color_status ${diag_red}
set -g fish_color_cancel ${number}
set -g fish_color_search_match --background=${line}

# Completion Pager Colors
set -g fish_pager_color_progress ${alt}
set -g fish_pager_color_prefix ${type}
set -g fish_pager_color_completion ${fg}
set -g fish_pager_color_description ${comment}
set -g fish_pager_color_selected_prefix ${alt}
set -g fish_pager_color_selected_completion ${alt}
set -g fish_pager_color_selected_background --background=${line}
]=],
        fish_colors
    )

    return fish
end

return M

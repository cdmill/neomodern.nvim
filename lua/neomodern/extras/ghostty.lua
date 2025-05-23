local Util = require("neomodern.util")

local M = {}

function M.generate(colors, info)
    colors.extra = info.extra
    colors.url = info.url
    colors.upstream = info.upstream
    colors.theme = info.theme
    local c = {}
    for k, v in pairs(c) do
        if type(v) == "string" then
            c[k] = v:gsub("^#", "")
        end
    end

    local ghostty = Util.template(
        [=[
# name: ${theme} colors for ${extra}
# url: ${url}
# upstream: ${upstream}
# author: Casey Miller

palette = 0=${black}
palette = 1=${red}
palette = 2=${green}
palette = 3=${yellow}
palette = 4=${blue}
palette = 5=${purple}
palette = 6=${cyan}
palette = 7=${fg}
palette = 8=${grey}
palette = 9=${red}
palette = 10=${green}
palette = 11=${yellow}
palette = 12=${blue}
palette = 13=${magenta}
palette = 14=${cyan}
palette = 15=${fg}
background = ${bg}
foreground = {$fg}
cursor-color = {$fg}
selection-background = ${visual}
selection-foreground = ${alt}
]=],
        c
    )

    return ghostty
end

return M

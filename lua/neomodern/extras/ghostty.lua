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

palette = 0=${c00}
palette = 1=${c01}
palette = 2=${c02}
palette = 3=${c03}
palette = 4=${c04}
palette = 5=${c05}
palette = 6=${c06}
palette = 7=${c07}
palette = 8=${c08}
palette = 9=${c09}
palette = 10=${c0A}
palette = 11=${c0B}
palette = 12=${c0C}
palette = 13=${c0D}
palette = 14=${c0E}
palette = 15=${c0F}
background = ${bg}
foreground = {$fg}
cursor-color = {$fg}
selection-background = ${visual}
selection-foreground = ${type}
]=],
        c
    )

    return ghostty
end

return M

local Util = require("neomodern.util")

local M = {}

function M.generate(colors, info)
    colors.extra = info.extra
    colors.url = info.url
    colors.upstream = info.upstream
    colors.theme = info.theme
    local c = {}
    for k, v in pairs(colors) do
        if type(v) == "string" then
            c[k] = v:gsub("^#", "")
        end
    end

    local foot = Util.template(
        [=[
# name: ${theme} colors for ${extra}
# url: ${url}
# upstream: ${upstream}
# author: Casey Miller

[cursor]
color=${fg} ${visual}

[colors]
foreground=${fg}
background=${bg}
# alternate, darker background=${alt_bg}
selection-foreground=${fg}
selection-background=${visual}
urls=${c04}

regular0=${c00}
regular1=${c01}
regular2=${c02}
regular3=${c03}
regular4=${c04}
regular5=${c05}
regular6=${c06}
regular7=${c07}

bright0=${c08}
bright1=${c09}
bright2=${c0A}
bright3=${c0B}
bright4=${c0C}
bright5=${c0D}
bright6=${c0E}
bright7=${c0F}

16=${alt_bg}
17=${alt}
]=],
        c
    )

    return foot
end

return M

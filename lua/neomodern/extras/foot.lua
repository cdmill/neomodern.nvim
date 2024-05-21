-- CREDIT: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/extra/foot.lua

local util = require("neomodern.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  local footColors = {}
  for k, v in pairs(colors) do
    if type(v) == "string" then
      footColors[k] = v:gsub("^#", "")
    end
  end

  local foot = util.template(
    [[
[cursor]
color=${fg} ${bg_visual}

[colors]
foreground=${fg}
background=${bg}
selection-foreground=${fg}
selection-background=${selection}
urls=${blue}

regular0=${black}
regular1=${red}
regular2=${green}
regular3=${yellow}
regular4=${blue}
regular5=${purple}
regular6=${cyan}
regular7=${fg}

bright0=${grey}
bright1=${red}
bright2=${green}
bright3=${yellow}
bright4=${blue}
bright5=${magenta}
bright6=${cyan}
bright7=${fg}

16=${orange}
17=${alt}
]],
    footColors
  )

  return foot
end

return M

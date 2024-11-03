-- CREDIT: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/extra/foot.lua

local util = require("neomodern.util")

local M = {}

function M.generate(colors)
  local foot_colors = {}
  for k, v in pairs(colors) do
    if type(v) == "string" then
      foot_colors[k] = v:gsub("^#", "")
    end
  end

  local foot = util.template(
    [[
[cursor]
color=${fg} ${visual}

[colors]
foreground=${fg}
background=${bg}
selection-foreground=${fg}
selection-background=${visual}
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
    foot_colors
  )

  return foot
end

return M

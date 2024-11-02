-- CREDIT: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/extra/fzf.lua

local M = {}
local util = require("neomodern.util")

function M.generate(colors)
  return util.template(
    [[
  export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
  --color=fg:${fg},bg:${bg},hl:${property},gutter:${bg}
  --color=fg+:${fg},bg+:${line},hl+:${type}
  --color=info:${comment},prompt:${property},pointer:${property}
  --color=marker:${keyword},spinner:${keyword},header:${keyword}"
  ]],
    colors
  )
end

return M

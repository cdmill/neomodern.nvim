local M = {}
local util = require("neomodern.util")

function M.generate(colors)
  return util.template(M.template, colors)
end

M.template = [[
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color=fg:${fg},bg:${bg},hl:${type},gutter:${bg} \
--color=fg+:${fg},bg+:${visual},hl+:${type} \
--color=info:${comment},prompt:${property},pointer:${property} \
--color=marker:${keyword},spinner:${keyword},header:${keyword}"
]]

return M

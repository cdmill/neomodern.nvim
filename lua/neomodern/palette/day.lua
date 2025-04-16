local M = {}

M.get = function()
    local Config = require("neomodern").options()
    ---@type neomodern.Theme
    local c = require("neomodern.palette")[Config.theme]
    local Util = require("neomodern.util")
    return Util.generate_light_variant(vim.deepcopy(c))
end

return M

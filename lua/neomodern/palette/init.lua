---@class neomodern.Theme.Terminal
---@field black string
---@field grey string
---@field red string
---@field orange string
---@field green string
---@field yellow string
---@field blue string
---@field purple string
---@field magenta string
---@field cyan string
---@field white string

---@class neomodern.Theme
---@field alt string highlight
---@field alt_bg string dim alternate background
---@field bg string background
---@field builtin string default/builtin library
---@field comment string comments
---@field constant string constants
---@field fg string foreground
---@field func string functions
---@field keyword string keywords
---@field line string line highlights: e.g. cursor line
---@field number string number/boolean
---@field operator string operators
---@field property string class properties
---@field string string strings
---@field type string types
---@field visual string visual selection
---@field diag_red string diagnostics red color (e.g. error)
---@field diag_blue string diagnostics blue color (e.g. hint)
---@field diag_yellow string diagnostics yellow color (e.g. warning)
---@field diag_green string diagnostics green color (e.g. diffadd)
---@field colormap neomodern.Theme.Terminal mapping to terminal colors

local M = {}

---@enum Themes
M.themes = {
    iceclimber = "iceclimber",
    gyokuro = "gyokuro",
    hojicha = "hojicha",
    darkforest = "darkforest",
    roseprime = "roseprime",
    daylight = "daylight",
}

for k, theme in pairs(M.themes) do
    M[k] = require("neomodern.palette." .. theme)
end

return M

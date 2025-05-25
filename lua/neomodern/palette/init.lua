local Util = require("neomodern.util")
local M = {}

---@class neomodern.Theme
---@field alt string highlight
---@field alt_bg string dim alternate background
---@field bg string background
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
---@field colormap nil|neomodern.Theme.Terminal mapping to terminal colors

---@class neomodern.Theme.Terminal
---@field c00 string
---@field c01 string
---@field c02 string
---@field c03 string
---@field c04 string
---@field c05 string
---@field c06 string
---@field c07 string
---@field c08 string
---@field c09 string
---@field c0A string
---@field c0B string
---@field c0C string
---@field c0D string
---@field c0E string
---@field c0F string

---@enum Themes
M.themes = {
    iceclimber = "iceclimber",
    gyokuro = "gyokuro",
    hojicha = "hojicha",
    roseprime = "roseprime",
}

for key, theme in pairs(M.themes) do
    M[key] = require("neomodern.palette." .. theme)
    local T = M[key]

    ---@type neomodern.Theme.Terminal
    T.colormap = {
        c00 = T.comment, -- black
        c01 = Util.blend(T.keyword, 0.6, T.bg), -- red
        c02 = Util.blend(T.string, 0.6, T.bg), -- green
        c03 = Util.blend(T.constant, 0.6, T.bg), -- yellow
        c04 = Util.blend(T.func, 0.6, T.bg), -- blue
        c05 = Util.blend(T.number, 0.6, T.bg), -- magenta
        c06 = Util.blend(T.property, 0.6, T.bg), -- cyan
        c07 = Util.blend(T.fg, 0.6, T.bg), -- white
        c08 = T.operator, -- bright black
        c09 = T.keyword, -- bright red
        c0A = T.string, -- bright green
        c0B = T.constant, -- bright yellow
        c0C = T.func, -- bright blue
        c0D = T.number, -- bright magenta
        c0E = T.property, -- bright cyan
        c0F = T.fg, -- bright white
    }
end

---Returns a read-only copy of the light or dark variant of a theme.
---@param theme string
---@param variant string
M.get = function(theme, variant)
    if variant == "light" then
        return require("neomodern.palette.day").get()
    else
        return vim.deepcopy(M[theme])
    end
end

return M

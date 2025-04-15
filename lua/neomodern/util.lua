local M = {}

M.bg = "#000000"
M.fg = "#ffffff"
M.day_brightness = 1e-8

---@param color string hex color code
---@return table
local function hexToRgb(color)
    local hex = "[abcdef0-9][abcdef0-9]"
    local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
    color = string.lower(color)

    assert(
        string.find(color, pat) ~= nil,
        "hex_to_rgb: invalid hex_str: " .. tostring(color)
    )

    local r, g, b = string.match(color, pat)
    return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

---@param fg string foreground color in hex
---@param bg string background color in hex
---@param amount number blend coefficient between 0=bg and 1=fg
function M.blend(fg, amount, bg)
    local FG = hexToRgb(fg)
    local BG = hexToRgb(bg)
    local alpha = math.abs(amount)

    local blendChannel = function(i)
        local ret = ((1 - alpha) * BG[i] + alpha * FG[i])
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return string.format(
        "#%02X%02X%02X",
        blendChannel(1),
        blendChannel(2),
        blendChannel(3)
    )
end

---@param color string|neomodern.Theme
function M.invert(color)
    if type(color) == "table" then
        for key, value in pairs(color) do
            color[key] = M.invert(value)
        end
    elseif type(color) == "string" then
        local hsluv = require("neomodern.hsluv")
        if color ~= "none" then
            local hsl = hsluv.hex_to_hsluv(color)
            hsl[3] = 100 - hsl[3]
            if hsl[3] < 50 then
                hsl[3] = hsl[3] + (100 - hsl[3]) * M.day_brightness
            elseif hsl[3] > 50 then
                hsl[3] = hsl[3] - (100 - hsl[3]) * M.day_brightness
            end
            return hsluv.hsluv_to_hex(hsl)
        end
    end
    return color
end

-- SOURCE: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/util.lua
---@param str string template string
---@param table table key value pairs to replace in the string
function M.template(str, table)
    return (
        str:gsub("($%b{})", function(w)
            return vim.tbl_get(
                table,
                unpack(vim.split(w:sub(3, -2), ".", { plain = true }))
            ) or w
        end)
    )
end

return M

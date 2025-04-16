local M = {}

M.bg = "#000000"
M.fg = "#ffffff"

---Translates color from HTML to RGB
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

---Util for blending colors. Alpha coefficeint should be between [0-1]
---where 0=b and 1=a.
---@param a string foreground color in hex
---@param b string background color in hex
---@param coeff number blend coefficient
function M.blend(a, coeff, b)
    local A = hexToRgb(a)
    local B = hexToRgb(b)
    local alpha = math.abs(coeff)

    local blendChannel = function(i)
        local ret = ((1 - alpha) * B[i] + alpha * A[i])
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return string.format(
        "#%02X%02X%02X",
        blendChannel(1),
        blendChannel(2),
        blendChannel(3)
    )
end

---@param colors neomodern.Theme
function M.generate_light_variant(colors)
    local hsluv = require("neomodern.hsluv")
    local saturation_coeff = 25e-2
    local brightness_coeff = 1e-4
    local function invert(cname, cval)
        if type(cval) == "table" then
            for k, v in pairs(cval) do
                cval[k] = invert(k, v)
            end
            return cval
        elseif type(cval) == "string" and cval ~= "none" then
            local hsl = hsluv.hex_to_hsluv(cval)

            if cname:find("bg$") and hsl[3] < 50 then
                hsl[3] = 98 - hsl[3]
                hsl[3] = hsl[3] + (98 - hsl[3]) * brightness_coeff
            else
                -- increase saturation
                hsl[2] = hsl[2] + (100 - hsl[2]) * saturation_coeff
                hsl[3] = 100 - hsl[3]
                if hsl[3] < 50 then
                    -- increase brightness
                    hsl[3] = hsl[3] + (100 - hsl[3]) * brightness_coeff
                end
            end
            return hsluv.hsluv_to_hex(hsl)
        end
    end

    for k, v in pairs(colors) do
        colors[k] = invert(k, v)
    end
    return colors
end

---SOURCE: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/util.lua
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

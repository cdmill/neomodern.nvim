local M = {}
local Util = require("neomodern.util")

---Returns the terminal colors associated with a theme, and optionally the entire
---palette.
---@param with_palette boolean include the theme's palette colors
---@return table
function M.colors(with_palette)
    ---@type neomodern.Config
    local Config = require("neomodern").options()
    local palette = require("neomodern.palette").get(Config.theme, Config.variant)
    palette.dim = Util.blend(palette.bg, 0.9, "#000000")
    if with_palette then
        return vim.tbl_deep_extend("force", palette.colormap, palette)
    end
    return palette.colormap
end

---Sets the vim terminal colors if `term_colors` is set in `neomodern.Config`.
function M.setup()
    ---@type neomodern.Config
    local Config = require("neomodern").options()
    if not Config.term_colors then
        return
    end
    local colors = M.colors(false)
    vim.g.terminal_color_0 = colors.c00
    vim.g.terminal_color_1 = colors.c01
    vim.g.terminal_color_2 = colors.c02
    vim.g.terminal_color_3 = colors.c03
    vim.g.terminal_color_4 = colors.c04
    vim.g.terminal_color_5 = colors.c05
    vim.g.terminal_color_6 = colors.c06
    vim.g.terminal_color_7 = colors.c07
    vim.g.terminal_color_8 = colors.c08
    vim.g.terminal_color_9 = colors.c09
    vim.g.terminal_color_10 = colors.c0A
    vim.g.terminal_color_11 = colors.c0B
    vim.g.terminal_color_12 = colors.c0C
    vim.g.terminal_color_13 = colors.c0D
    vim.g.terminal_color_14 = colors.c0E
    vim.g.terminal_color_15 = colors.c0F
end

return M

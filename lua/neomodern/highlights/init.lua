local M = {}

---@alias Highlight {fg:string, bg:string, sp:string, fmt:string}

---@param highlights table<string,Highlight>
local function vim_highlights(highlights)
    for group, hi in pairs(highlights) do
        vim.api.nvim_command(
            string.format(
                "highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
                group,
                hi.fg or "none",
                hi.bg or "none",
                hi.sp or "none",
                hi.fmt or "none"
            )
        )
    end
end

---@param prefix string
---@param color string
---@param palette neomodern.Theme
---@return string
local function overwrite(prefix, color, palette)
    if not color then
        return ""
    end
    if color:sub(1, 1) == "$" then
        local name = color:sub(2, -1)
        color = palette[name]
        if not color then
            vim.schedule(function()
                vim.notify(
                    'neomodern.nvim: unknown color "' .. name .. '"',
                    vim.log.levels.ERROR,
                    { title = "neomodern.nvim" }
                )
            end)
            return ""
        end
    end
    return prefix .. "=" .. color
end

function M.setup()
    ---@type neomodern.Config
    local Config = require("neomodern").options()
    ---@type neomodern.Theme
    local c = require("neomodern.palette").get(Config.theme, Config.variant)

    local COMMON = require("neomodern.highlights.common").get()
    local SYNTAX = require("neomodern.highlights.syntax").get()
    local PLUGIN = require("neomodern.highlights.plugin").get()

    vim_highlights(COMMON)
    for _, group in pairs(SYNTAX) do
        vim_highlights(group)
    end
    for _, group in pairs(PLUGIN) do
        vim_highlights(group)
    end

    for group, hi in pairs(Config.highlights) do
        vim.api.nvim_command(
            string.format(
                "highlight %s %s %s %s %s",
                group,
                overwrite("guifg", hi.fg, c),
                overwrite("guibg", hi.bg, c),
                overwrite("guisp", hi.sp, c),
                overwrite("gui", hi.fmt, c)
            )
        )
    end
    if Config.favor_treesitter_hl then
        vim.highlight.priorities.semantic_tokens = 95
    end
end

return M

local c = require("neomodern.colors")
local config = vim.g.neomodern_config
local M = {}

local function vim_highlights(highlights)
    if highlights == nil then
        return
    end
    for group_name, group_settings in pairs(highlights) do
        vim.api.nvim_command(
            string.format(
                "highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
                group_name,
                group_settings.fg or "none",
                group_settings.bg or "none",
                group_settings.sp or "none",
                group_settings.fmt or "none"
            )
        )
    end
end

function M.setup()
    local COMMON = require("neomodern.highlights.common")
    local SYNTAX = require("neomodern.highlights.syntax")
    local PLUGIN = require("neomodern.highlights.plugin")

    vim_highlights(COMMON)
    vim_highlights(SYNTAX.vim)
    vim_highlights(SYNTAX.treesitter)
    vim_highlights(SYNTAX.lsp)
    for _, group in pairs(PLUGIN) do
        vim_highlights(group)
    end

    -- user defined highlights: vim_highlights function cannot be used because it sets an
    -- attribute to none if not specified
    local function replace_color(prefix, color_name)
        if not color_name then
            return ""
        end
        if color_name:sub(1, 1) == "$" then
            local name = color_name:sub(2, -1)
            color_name = c[name]
            if not color_name then
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
        return prefix .. "=" .. color_name
    end

    for group_name, group_settings in pairs(vim.g.neomodern_config.highlights) do
        vim.api.nvim_command(
            string.format(
                "highlight %s %s %s %s %s",
                group_name,
                replace_color("guifg", group_settings.fg),
                replace_color("guibg", group_settings.bg),
                replace_color("guisp", group_settings.sp),
                replace_color("gui", group_settings.fmt)
            )
        )
    end
    if config.favor_treesitter_hl then
        vim.highlight.priorities.semantic_tokens = 95
    end
end

return M

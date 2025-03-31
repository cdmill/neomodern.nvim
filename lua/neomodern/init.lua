local Config = require("neomodern.config")
local M = {
    ---@class neomodern.Config
    ---@field alt_bg? boolean If true, uses a darker alternate bg color
    ---@field theme? string Preferred theme
    ---@field colors? table Has string fields to override default colors
    ---@field colored_docstrings? boolean If true, highlights docstrings like strings instead like of comments
    ---@field code_style? table Has string values to determine code style. Field values can be the same as gui highlight values, e.g. 'bold', 'italic', 'none'
    ---@field cursorline_gutter? boolean If true, highlights {sign, fold}column the same as cursorline
    ---@field dark_gutter? boolean If true, highlights the gutter darker than the bg
    ---@field diagnostics? table { darker:bool, undercurl:bool, background:bool }
    ---@field favor_treesitter_hl? boolean if true favor treesitter highlights over semantic highlights
    ---@field highlights? table Has string fields to override default highlights
    ---@field plain_float? boolean If true, does not set background of floating windows. Recommend for when using floating windows with borders
    ---@field plugin? table Has table or string fields to determine appearnce of plugins. Current plugin options are 'lualine', 'cmp', and 'telescope'
    ---@field show_eob? boolean If true, highlights end-of-buffer tildes like comments
    ---@field term_colors? boolean If true, enables terminal colors
    ---@field toggle_mode_key? nil|string Keymap (normal mode) to toggle light/dark mode
    ---@field transparent? boolean If true, does not set background colors
    __opts = {},
}

function M.options()
    return M.__opts
end

---Toggle between light/dark mode.
function M.toggle_mode()
    if M.__opts.theme ~= "daylight" then
        vim.api.nvim_command("colorscheme daylight")
    else
        vim.api.nvim_command("colorscheme " .. M.__theme)
    end
end

---Apply the colorscheme (same as `:colorscheme neomodern`).
---@param theme string?
function M.colorscheme(theme)
    M.__opts.theme = theme or M.__opts.theme
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end
    vim.o.termguicolors = true
    vim.g.colors_name = M.__opts.theme
    if vim.o.background == "light" then
        M.__opts.theme = "daylight"
    end
    require("neomodern.highlights").setup()
    require("neomodern.terminal").setup()
end

---Sets neomodern.nvim options, without applying colorscheme. Any specified user opts automatically override default
---config values. To apply colorscheme, call `neomodern.load()`.
---@param opts neomodern.Config
function M.setup(opts)
    ---@type neomodern.Config
    M.__opts = vim.tbl_deep_extend("force", Config.default, opts or {})
    M.__theme = M.__opts.theme
    if M.__opts.toggle_mode_key then
        vim.keymap.set(
            "n",
            M.__opts.toggle_mode_key,
            '<cmd>lua require("neomodern").toggle_mode()<cr>',
            { noremap = true, silent = true }
        )
    end
end

function M.load()
    vim.api.nvim_command("colorscheme " .. M.__opts.theme)
end

return M

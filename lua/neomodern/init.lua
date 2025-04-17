local Config = require("neomodern.config")
local M = {
    ---@type neomodern.Config
    __opts = {},
}

---Returns a read-only copy of the config.
---@return neomodern.Config
function M.options()
    return vim.deepcopy(M.__opts)
end

---Toggle between light/dark variants.
function M.toggle_variant()
    if vim.o.background == "light" then
        vim.o.background = "dark"
        vim.api.nvim_command("colorscheme " .. M.__opts.theme)
    else
        vim.api.nvim_command("colorscheme neomodern-day")
    end
end

---Apply the colorscheme (same as `:colorscheme neomodern`).
---@param theme string?
function M.load(theme)
    M.__opts.theme = theme or M.__opts.theme
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end
    vim.o.termguicolors = true
    vim.g.colors_name = M.__opts.theme
    if vim.o.background == "light" then
        M.__opts.variant = "light"
    else
        M.__opts.variant = "dark"
    end
    require("neomodern.highlights").setup()
    require("neomodern.terminal").setup()
end

---Set the config options.
---@param opts neomodern.Config
function M.setup(opts)
    ---@type neomodern.Config
    M.__opts = vim.tbl_deep_extend("force", Config.default, opts or {})
    M.__theme = M.__opts.theme
    if M.__opts.toggle_variant_key then
        vim.keymap.set(
            "n",
            M.__opts.toggle_variant_key,
            '<cmd>lua require("neomodern").toggle_variant()<cr>',
            { noremap = true, silent = true }
        )
    end
end

return M

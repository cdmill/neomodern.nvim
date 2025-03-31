local M = {}

---@type neomodern.Config
M.default = {
    alt_bg = false,
    colored_docstrings = true,
    cursorline_gutter = true,
    dark_gutter = false,
    favor_treesitter_hl = false,
    plain_float = false,
    show_eob = true,
    term_colors = true,
    theme = "iceclimber",
    toggle_mode_key = nil,
    transparent = false,

    code_style = {
        comments = "italic",
        conditionals = "none",
        functions = "none",
        keywords = "none",
        headings = "bold",
        operators = "none",
        keyword_return = "none",
        strings = "none",
        variables = "none",
    },

    colors = {},

    diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
    },

    highlights = {},

    plugin = {
        lualine = {
            bold = true,
            plain = false,
        },
        cmp = {
            plain = false,
            reverse = false,
        },
        telescope = "bordered",
    },
}

return M

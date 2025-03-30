local M = {}

---@type neomodern.Config
M.default = {
    theme = "iceclimber",
    toggle_mode_key = nil,
    transparent = false,
    term_colors = true,
    colored_docstrings = true,
    colored_brackets = true,
    plain_float = false,
    show_eob = true,
    cursorline_gutter = true,
    dark_gutter = false,
    alt_culnr_hl = true,
    favor_treesitter_hl = false,

    diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
    },

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

    colors = {},
    highlights = {},
}

return M

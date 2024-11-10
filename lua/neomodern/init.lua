local M = {}

M.theme_list = { "iceclimber", "coffeecat", "darkforest", "roseprime", "daylight" }

---Change neomodern option (`vim.g.neomodern_config.option`)
---It can't be changed directly by modifying that field due to a Neovim lua bug with
---global variables (`neomodern_config` is a global variable).
---@param opt string option name
---@param value any new value
function M.set_options(opt, value)
  local cfg = vim.g.neomodern_config
  cfg[opt] = value
  vim.g.neomodern_config = cfg
end

---Apply the colorscheme (same as `:colorscheme neomodern`).
function M.colorscheme()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "neomodern"
  if vim.o.background == "light" then
    M.set_options("theme", "daylight")
  elseif vim.g.neomodern_config.theme == "daylight" then
    M.set_options("theme", "daylight")
  end
  require("neomodern.highlights").setup()
  require("neomodern.terminal").setup()
end

---Cycle between neomodern themes. To change which themes are included, change the
---`cycle_theme_list` in your configuration when calling `neomodern.setup()`.
function M.cycle_theme()
  local index = vim.g.neomodern_config.cycle_theme_index + 1
  if index > #vim.g.neomodern_config.cycle_theme_list then
    index = 1
  end
  M.set_options("theme", vim.g.neomodern_config.cycle_theme_list[index])
  M.set_options("cycle_theme_index", index)
  vim.api.nvim_command(string.format("colorscheme %s", vim.g.neomodern_config.theme))
end

---Toggle between light/dark mode. Recommended to remove `daylight` from
---`cycle_theme_list` for more intuitive cycle behavior with
---`neomodern.cycle_theme()`.
function M.toggle_mode()
  if vim.g.neomodern_config.theme ~= "daylight" then
    M.set_options("prev_theme", vim.g.neomodern_config.theme)
    M.set_options("prev_theme_index", vim.g.neomodern_config.cycle_theme_index)
    M.set_options("theme", "daylight")
    vim.api.nvim_command("colorscheme daylight")
    M.set_options("cycle_theme_index", vim.g.neomodern_config.prev_theme_index)
  else
    M.set_options("theme", vim.g.neomodern_config.prev_theme)
    M.set_options("cycle_theme_index", vim.g.neomodern_config.prev_theme_index)
    vim.api.nvim_command(string.format("colorscheme %s", vim.g.neomodern_config.theme))
  end
end

---@class (exact) neomodern.Config
---@field theme? string Preferred theme
---@field cycle_theme_key? nil|string Keymap (normal mode) to cycle between themes
---@field cycle_theme_list? table Themes to cycle through when using `cycle_theme_key` keymap.
---@field toggle_mode_key? nil|string Keymap (normal mode) to toggle light/dark mode
---@field transparent? boolean If true, does not set background colors
---@field term_colors? boolean If true, enables terminal colors
---@field colored_docstrings? boolean If true, highlights docstrings like strings instead like of comments
---@field colored_brackets? boolean If false, highlights brackets like default fg color
---@field plain_float? boolean If true, does not set background of floating windows. Recommend for when using floating windows with borders
---@field show_eob? boolean If true, highlights end-of-buffer tildes like comments
---@field cursorline_gutter? boolean If true, highlights {sign, fold}column the same as cursorline
---@field diagnostics? table Has boolean fields to determine diagnostics appearance: 'darker', 'undercurl', 'background'
---@field code_style? table Has string values to determine code style. Field values can be the same as gui highlight values, e.g. 'bold', 'italic', 'none'
---@field plugin? table Has table or string fields to determine appearnce of plugins. Current plugin options are 'lualine', 'cmp', and 'telescope'
---@field colors? table Has string fields to override default colors
---@field highlights? table Has string fields to override default highlights
local default_config = {
  theme = "iceclimber", -- Choose between 'iceclimber', 'coffeecat', 'darkforest', 'roseprime', 'daylight'
  cycle_theme_key = nil,
  cycle_theme_list = M.theme_list,
  toggle_mode_key = nil,
  transparent = false,
  term_colors = true,
  colored_docstrings = true,
  colored_brackets = true,
  plain_float = false,
  show_eob = true,
  cursorline_gutter = true,
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
    headings = "bold", -- Markdown headings
    operators = "none",
    keyword_return = "none",
    strings = "none",
    variables = "none",
  },

  plugin = {
    lualine = {
      bold = true,
      plain = false, -- Don't set section/component backgrounds
    },
    cmp = {
      plain = false, --Don't highlight lsp-kind items
      reverse = false, -- Reverse item kind highlights in cmp menu
    },
    telescope = "bordered", -- Options are 'borderless' or 'bordered'
  },

  colors = {},
  highlights = {},
}

---Sets neomodern.nvim options, without applying colorscheme. Any specified user opts automatically override default
---config values. To apply colorscheme, call `neomodern.load()`.
---@param opts neomodern.Config
function M.setup(opts)
  if not vim.g.neomodern_config or not vim.g.neomodern_config.loaded then -- if it's the first time setup() is called
    vim.g.neomodern_config =
      vim.tbl_deep_extend("keep", vim.g.neomodern_config or {}, default_config)
    M.set_options("loaded", true)
  end
  if opts then
    vim.g.neomodern_config = vim.tbl_deep_extend("force", vim.g.neomodern_config, opts)
    if opts.cycle_theme_list then -- this table cannot be extended, it has to be replaced
      M.set_options("cycle_theme_list", opts.cycle_theme_list)
    end
  end
  if vim.g.neomodern_config.cycle_theme_key then
    vim.keymap.set(
      "n",
      vim.g.neomodern_config.cycle_theme_key,
      '<cmd>lua require("neomodern").cycle_theme()<cr>',
      { noremap = true, silent = true }
    )
  end
  for i, v in ipairs(vim.g.neomodern_config.cycle_theme_list) do
    if v == vim.g.neomodern_config.theme then
      M.set_options("cycle_theme_index", i)
    end
  end

  if vim.g.neomodern_config.toggle_mode_key then
    vim.keymap.set(
      "n",
      vim.g.neomodern_config.toggle_mode_key,
      '<cmd>lua require("neomodern").toggle_mode()<cr>',
      { noremap = true, silent = true }
    )
  end
end

---Convenience function to be called after setup that sets colorscheme to theme chosen
---in config opts. Defaults to `iceclimber`.
function M.load()
  vim.api.nvim_command(string.format("colorscheme %s", vim.g.neomodern_config.theme))
end

return M

local M = {}

M.styles_list = { "icebreaker", "coffeecat", "darkforest", "roseprime" }

---Change neomodern option (vim.g.neomodern_config.option)
---It can't be changed directly by modifying that field due to a Neovim lua bug with global variables (neomodern_config is a global variable)
---@param opt string: option name
---@param value any: new value
function M.set_options(opt, value)
  local cfg = vim.g.neomodern_config
  cfg[opt] = value
  vim.g.neomodern_config = cfg
end

---Apply the colorscheme (same as ':colorscheme neomodern')
function M.colorscheme()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "neomodern"
  if vim.o.background == "light" then
    M.set_options("style", "day")
  elseif vim.g.neomodern_config.style == "light" then
    M.set_options("style", "icebreaker")
  end
  require("neomodern.highlights").setup()
  require("neomodern.terminal").setup()
end

---Toggle between neomodern styles
function M.toggle()
  local index = vim.g.neomodern_config.toggle_style_index + 1
  if index > #vim.g.neomodern_config.toggle_style_list then
    index = 1
  end
  M.set_options("style", vim.g.neomodern_config.toggle_style_list[index])
  M.set_options("toggle_style_index", index)
  if vim.g.neomodern_config.style == "light" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
  vim.api.nvim_command("colorscheme neomodern")
end

local default_config = {
  -- Main options --
  style = "icebreaker", -- choose between 'icebreaker', 'coffeecat', 'darkforest', 'dawn', 'roseprime'
  toggle_style_key = nil,
  toggle_style_list = M.styles_list,
  transparent = false, -- don't set background
  term_colors = true, -- if true enable the terminal

  -- Changing Formats --
  code_style = {
    comments = "italic",
    conditionals = "none",
    functions = "none",
    keywords = "none",
    headings = "bold", -- markdown headers
    operators = "none",
    keyword_return = "none",
    strings = "none",
    variables = "none",
  },

  ui = {
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
    colored_docstrings = true, -- highlight docstrings like strings
    plain = false, -- don't set background for search
    show_eob = true, -- show the end-of-buffer tildes

    -- Plugins Related --
    lualine = {
      bold = true,
      plain = true,
    },
    diagnostics = {
      darker = true, -- darker colors for diagnostic
      undercurl = true, -- use undercurl for diagnostics
      background = true, -- use background color for virtual text
    },
  },

  -- Custom Highlights --
  colors = {}, -- Override default colors
  highlights = {}, -- Override highlight groups
}

---Setup neomodern.nvim options, without applying colorscheme
---@param opts table: a table containing options
function M.setup(opts)
  if not vim.g.neomodern_config or not vim.g.neomodern_config.loaded then -- if it's the first time setup() is called
    vim.g.neomodern_config =
      vim.tbl_deep_extend("keep", vim.g.neomodern_config or {}, default_config)
    M.set_options("loaded", true)
    M.set_options("toggle_style_index", 0)
  end
  if opts then
    vim.g.neomodern_config = vim.tbl_deep_extend("force", vim.g.neomodern_config, opts)
    if opts.toggle_style_list then -- this table cannot be extended, it has to be replaced
      M.set_options("toggle_style_list", opts.toggle_style_list)
    end
  end
  if vim.g.neomodern_config.toggle_style_key then
    vim.api.nvim_set_keymap(
      "n",
      vim.g.neomodern_config.toggle_style_key,
      '<cmd>lua require("neomodern").toggle()<cr>',
      { noremap = true, silent = true }
    )
  end
end

function M.load()
  vim.api.nvim_command("colorscheme neomodern")
end

return M

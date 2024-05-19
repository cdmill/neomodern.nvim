# NEOMODERN.nvim

A collection of themes (5 dark, 1 light) written in [Lua](https://www.lua.org) for [Neovim](https://github.com/neovim/neovim) $\geq$ 0.9. 
Support for [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlighting and LSP semantic highlighting.
Forked from [OneDark.nvim](https://github.com/navarasu/onedark.nvim).

Themes have been designed to be unintrusive,simple, and pleasing to the eyes.

## Gallery

### ICECLIMBER

A dark theme with colors inspired from Nintendo's Ice Climbers characters

<details open>
<summary>Click to toggle previews</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/iceclimber.png)

</details>

### COFFEECAT

A dark, brown pastel theme

<details open>
<summary>Click to toggle previews</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/coffeecat.png)

</details>

### DARKFOREST

A darker, greener take on the classic [Everforest](https://github.com/sainnhe/everforest) theme

<details open>
<summary>Click to toggle previews</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/darkforest.png)

</details>

### CAMPFIRE

A dark, purple-based theme with fiery highlights

<details open>
<summary>Click to toggle previews</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/campfire.png)

</details>

### ROSEPRIME

Inspired by [ThePrimeagen's](https://github.com/ThePrimeagen) use of the [Rosé-Pine](https://github.com/rose-pine/neovim) theme with [tmux](https://github.com/tmux/tmux/wiki) and no color fixing.

<details open>
<summary>Click to toggle previews</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/roseprime.png)

</details>

### DAYLIGHT

A light variant of ICECLIMBER

<details open>
<summary>Click to toggle previews</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/daylight.png)

</details>

## Installation

Install via your favorite package manager:

```lua
-- Using lazy.nvim
{
  "cdmill/neomodern.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("neomodern").setup({
      -- optional configuration here
    })
    require("neomodern").load()
  end,
},
```

## Configuration

There are 6 themes included (5 dark, 1 light). The light theme is used when `{ style = "daylight" }` is passed to `setup(options)` or when `vim.o.background = "light"`.

Default options are given below

```lua
require("neomodern").setup({
  -- Main options --
  style = "iceclimber", -- choose between 'iceclimber', 'coffeecat', 'darkforest', 'campfire', 'roseprime', 'daylight'
  toggle_style_key = nil, -- keymap to cycle between styles
  toggle_style_list = { -- a table of which styles to cycle through, by default all styles are included
    "iceclimber",
    "coffeecat",
    "darkforest",
    "campfire",
    "roseprime",
    "daylight"
  }, 
  transparent = false, -- don't set background
  term_colors = true, -- if true enable the terminal

  -- Formatting --
  code_style = {
    comments = "italic",
    conditionals = "none",
    functions = "none",
    keywords = "none",
    headings = "bold", -- markdown headings
    operators = "none",
    keyword_return = "none",
    strings = "none",
    variables = "none",
  },

  -- UI options --
  ui = {
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
    colored_docstrings = true, -- if true, docstrings will be highlighted like strings, otherwise they will be highlighted like comments
    plain = false, -- don't set background for search
    show_eob = true, -- show the end-of-buffer tildes

    -- Plugins Related --
    lualine = {
      bold = true,
      plain = false, -- use a less distracting lualine. note: works best when no lualine separators are used
    },
    telescope = "borderless", -- choose between 'borderless' or 'bordered'
    diagnostics = {
      darker = true, -- darker colors for diagnostic
      undercurl = true, -- use undercurl for diagnostics
      background = true, -- use background color for virtual text
    },
  },

  -- Custom Highlights --
  colors = {}, -- Override default colors
  highlights = {}, -- Override highlight groups
})
require("neomodern").load()
```

Bordered Telescope
<details close>
<summary>Click to toggle previews</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/bordered.png)

</details>

Borderless Telescope
<details close>
<summary>Click to toggle previews</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/borderless.png)

</details>

Normal Lualine
<details close>
<summary>Click to toggle previews</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/regular_lualine.png)

</details>

Plain Lualine
<details close>
<summary>Click to toggle previews</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/plain_lualine.png)

</details>

## Customization

Example using custom colors and highlights:

```lua
require("neomodern").setup {
  colors = {
    orange = '#ff8800', -- define a new color
    keyword = '#817faf', -- redefine an existing color
  },
  highlights = {
    ...
    ["@keyword"] = { fg = "$keyword", fmt = 'bold' },
    ["@function"] = { bg = "$orange", fmt = 'underline,italic' },
    ...
  },
}
```

> [!NOTE]
> [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) keywords have changed for Neovim $\geq$ 0.8.


## Supported Plugins

- [Dashboard](https://github.com/nvimdev/dashboard-nvim)
- [cmp](https://github.com/hrsh7th/nvim-cmp)
- [Diffview](https://github.com/sindrets/diffview.nvim)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [Nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- plus more


## Contributing

Pull requests are welcome. 

If you are wanting to submit a new theme/style, please create a pull request with your new colors in [this file](https://github.com/cdmill/neomodern.nvim/blob/main/lua/neomodern/palette.lua).

If you are wanting support for a plugin, either open an issue or submit a pull request with your highlight additions in [this file](https://github.com/cdmill/neomodern.nvim/blob/main/lua/neomodern/highlights.lua).

## Inspiration

- [OneDark.nvim](https://github.com/navarasu/onedark.nvim)
- [Bamboo.nvim](https://github.com/ribru17/bamboo.nvim)
- [Catppuccin](https://github.com/catppuccin/nvim)
- [Everforest](https://github.com/sainnhe/everforest)
- [Rosé-Pine](https://github.com/rose-pine/neovim)
- [TokyoNight](https://github.com/folke/tokyonight.nvim)

## License

[MIT](https://choosealicense.com/licenses/mit/)







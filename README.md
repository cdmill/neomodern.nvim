# NEOMODERN.nvim

A collection of themes (4 dark, 1 light) written in [Lua](https://www.lua.org) for [Neovim](https://github.com/neovim/neovim) $\geq$ 0.9.
Support for [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlighting and LSP semantic highlighting.
Forked from [OneDark.nvim](https://github.com/navarasu/onedark.nvim).

Themes have been designed to be unintrusive, simple, and pleasing to the eyes.

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

> [!NOTE]
> `require("neomodern").load()` will call `set colorscheme` with your chosen style.
> If you prefer, you can use `vim.cmd([[colorscheme <style>]])` instead. For
> example, to use darkforest: `vim.cmd([[colorscheme darkforest]])`. Note if you
> use `vim.cmd([[colorscheme neomodern]])`, `iceclimber` will be used.

## Configuration

There are 5 themes included (4 dark, 1 light). The light theme is used when `{ style = "daylight" }` is passed to `setup(options)` or when `vim.o.background = "light"`.

Default options are given below

```lua
require("neomodern").setup({
  -- Main options --
  style = "iceclimber", -- choose between 'iceclimber', 'coffeecat', 'darkforest', 'roseprime', 'daylight'
  toggle_style_key = nil,
  toggle_style_list = M.styles_list,
  transparent = false, -- don't set background
  term_colors = true, -- if true enable the terminal
  colored_docstrings = true, -- if true, docstrings will be highlighted like strings, otherwise they will be highlighted like comments
  colored_brackets = true, -- if false, brackets will be highlighted similar to default fg color
  plain_float = false, -- don't set background of floating windows. recommended for when using floating windows with borders
  show_eob = true, -- show the end-of-buffer tildes
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true, -- use undercurl for diagnostics
    background = true, -- use background color for virtual text
  },

  -- Changing Formats --
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

  -- Plugin Related --
  plugin = {
    lualine = {
      bold = true,
      plain = false, -- don't set section/component backgrounds
    },
    cmp = {
      plain = false, --don't highlight lsp-kind items
      reverse = false, -- reverse item kind highlights in cmp menu
    },
    telescope = "bordered", -- options are 'borderless' or 'bordered'
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

## Extras

Available [here](https://github.com/cdmill/neomodern.nvim/tree/main/extras)

- [Alacritty](https://github.com/alacritty/alacritty)
- [Foot](https://codeberg.org/dnkl/foot)
- [FZF](https://github.com/junegunn/fzf)
- [kitty](https://github.com/kovidgoyal/kitty)
- [fish](https://github.com/fish-shell/fish-shell)
- [wezterm](https://github.com/wez/wezterm)
- [Windows Terminal](https://github.com/microsoft/terminal)
- [Iterm2](https://iterm2.com)

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
- [No Clown Fiesta](https://github.com/aktersnurra/no-clown-fiesta.nvim)

## License

[MIT](https://choosealicense.com/licenses/mit/)







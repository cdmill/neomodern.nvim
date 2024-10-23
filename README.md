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
> If you prefer, you can use `vim.cmd("colorscheme <style>")` instead. For
> example, to use darkforest: `vim.cmd("colorscheme darkforest")`. Note if you
> use `vim.cmd("colorscheme neomodern")`, `iceclimber` will be used.

## Configuration

There are 5 themes included (4 dark, 1 light).
The light theme is used when `{ style = "daylight" }` is passed to `setup(options)` or when `vim.o.background = "light"`.

Default options are given below

```lua
require("neomodern").setup({
  -- MAIN OPTIONS --
  -- Choose between 'iceclimber', 'coffeecat', 'darkforest', 'roseprime', 'daylight'
  theme = "iceclimber",
  -- Keymap (in normal mode) to toggle between themes in theme list
  cycle_theme_key = nil,
  cycle_theme_list = { "iceclimber", "coffeecat", "darkforest", "roseprime", "daylight" },
  -- Keymap (in normal mode) to toggle between light and dark mode.
  -- Recommended to remove `daylight` from `toggle_theme_list` if you are also using
  -- `cycle_theme_key` keymap for a more intuitive cycle behavior
  toggle_mode_key = nil,
  -- Don't set background
  transparent = false,
  -- If true, enable the terminal
  term_colors = true,
  -- If true, docstrings will be highlighted like strings, otherwise they will be highlighted
  -- like comments. Note, behavior is depending on the language server.
  colored_docstrings = true,
  -- If false, brackets will be highlighted similar to the default fg color
  colored_brackets = true,
  -- Don't set background of floating windows. Recommended for when using floating windows
  -- with borders.
  plain_float = false,
  -- Show the end-of-buffer tildes
  show_eob = true,
  diagnostics = {
    darker = true, -- Darker colors for diagnostic
    undercurl = true, -- Use undercurl for diagnostics
    background = true, -- Use background color for virtual text
  },

  -- CODE FORMATTING --
  -- The following table accepts values the same as the `gui` option for normal
  -- highlights. For example, `bold`, `italic`, `underline`, `none`.
  code_style = {
    comments = "italic",
    conditionals = "none",
    functions = "none",
    keywords = "none",
    -- Markdown headings
    headings = "bold",
    operators = "none",
    keyword_return = "none",
    strings = "none",
    variables = "none",
  },

  -- PLUGINS --
  -- The following options allow for more control over some plugin appearances.
  plugin = {
    lualine = {
      -- Bold lualine_a sections
      bold = true,
      -- Don't set section/component backgrounds. Recommended to not set
      -- section/component separators.
      plain = false,
    },
    cmp = {
      -- Don't highlight lsp-kind items. Only the current selection will be highlighted.
      plain = false,
      -- Reverse lsp-kind items' highlights in cmp menu.
      reverse = false,
    },
    -- Options are 'borderless' or 'bordered'.
    telescope = "bordered",
  },

  -- CUSTOM HIGHLIGHTS --
  -- Override default colors
  colors = {},
  -- Override highlight groups
  highlights = {},
})
-- Convenience function that simply calls `:colorscheme <theme>` with the theme
-- specified in your config. If not specified, `iceclimber` is used.
require("neomodern").load()
```

### Images for Select Config Opts

<details close>
<summary>Bordered Telescope</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/bordered-tscope.png)

</details>

<details close>
<summary>Borderless Telescope</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/borderless-tscope.png)

</details>

<details close>
<summary>Normal Lualine</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/roseprime.png)

</details>

<details close>
<summary>Plain Lualine</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/plain_lualine.png)

</details>

Example setup for plain cmp (preview below):

```lua
-- Use these opts in setup and also rounded borders enabled in your lsp config
require("neomodern").setup({
  plain_float = true,
  plugin = {
    cmp = {
      plain = true,
    },
  },
})
```

<details close>
<summary>Click to toggle preview for plain cmp</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/plain_cmp.png)

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

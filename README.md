# <p align="center"> *NEOMODERN*.nvim </p>

<p align="center">
modern — simple — unintrusive
</p>

<p align="center">
<img src="https://img.shields.io/github/v/tag/cdmill/neomodern.nvim?style=flat&label=RELEASE&labelColor=%23212123&color=%238a88db" />
<img src="https://img.shields.io/badge/BUILT_WITH_LUA-blue?style=flat&color=%23629da3" />
<img src="https://img.shields.io/badge/NEOVIM-0.9-blue?style=flat&logo=Neovim&labelColor=%23212123&color=%238a88db" />
</p>

> [!NOTE]
> With the release of `v1`, support was dropped for COFFEECAT, DARKFOREST, and DAYLIGHT.
> See [Legacy Support](#legacy-support) for details.

## Table of Contents

- 📷 [Gallery](#gallery)
- 🛠 [Installation](#installation)
- ⚙️ [Configuration](#configuration)
- 🎨 [Customization](#customization)
- 🔌 [Supported Plugins](#supported-plugins)
- 🆓 [Extras](#extras)
- 📌 [Legacy Support](#legacy-support)
- 🪄 [Contributing](#contributing)
- 💫 [Inspiration](inspiration)

## Gallery

### ❄️ *ICECLIMBER*

A theme with colors inspired from Nintendo's Ice Climbers characters

<details open>
<summary>Dark Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/iceclimber-dark.png)

</details>

<details closed>
<summary>Light Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/iceclimber-light.png)

</details>

### 🌱 *GYOKURO*

A fresh green tea inspired theme

<details open>
<summary>Dark Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/gyokuro-dark.png)

</details>

<details closed>
<summary>Light Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/gyokuro-light.png)

</details>

### 🍂 *HOJICHA*

A roasted green tea inspired theme

<details open>
<summary>Dark Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/hojicha-dark.png)

</details>

<details closed>
<summary>Light Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/hojicha-light.png)

</details>

### 🌷 *ROSEPRIME*

Inspired by [ThePrimeagen's](https://github.com/ThePrimeagen) use of the [Rosé-Pine](https://github.com/rose-pine/neovim) theme with [tmux](https://github.com/tmux/tmux/wiki) and no color fixing.

<details open>
<summary>Dark Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/roseprime-dark.png)

</details>

<details closed>
<summary>Light Variant</summary>

![image](https://github.com/cdmill/neomodern.nvim/blob/assets/roseprime-light.png)

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

There are 4 themes included, each with a light and dark variant.
The light theme is used when `{ variant = "light" }` is passed to `setup(options)` or
when `vim.o.background = "light"`.

Default options are given below:

```lua
require("neomodern").setup({
  -----MAIN OPTIONS-----
  --
  -- Can be one of: 'iceclimber' | 'gyokuro' | 'hojicha' | 'roseprime'
  theme = "iceclimber",
  -- Can be one of: 'light' | 'dark', or set via vim.o.background
  variant = "dark",
  -- Use an alternate, darker bg
  alt_bg = false,
  -- If true, docstrings will be highlighted like strings, otherwise they will be
  -- highlighted like comments. Note, behavior is dependent on the language server.
  colored_docstrings = true,
  -- If true, highlights the {sign,fold} column the same as cursorline
  cursorline_gutter = true,
  -- If true, highlights the gutter darker than the bg
  dark_gutter = false,
  -- if true favor treesitter highlights over semantic highlights
  favor_treesitter_hl = false,
  -- Don't set background of floating windows. Recommended for when using floating
  -- windows with borders.
  plain_float = false,
  -- Show the end-of-buffer character
  show_eob = true,
  -- If true, enable the vim terminal colors
  term_colors = true,
  -- Keymap (in normal mode) to toggle between light and dark variants.
  -- Does nothing if `theme="daylight"`.
  toggle_variant_key = nil,
  -- Don't set background
  transparent = false,

  -----DIAGNOSTICS and CODE STYLE-----
  --
  diagnostics = {
    darker = true, -- Darker colors for diagnostic
    undercurl = true, -- Use undercurl for diagnostics
    background = true, -- Use background color for virtual text
  },
  -- The following table accepts values the same as the `gui` option for normal
  -- highlights. For example, `bold`, `italic`, `underline`, `none`.
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

  -----PLUGINS-----
  --
  -- The following options allow for more control over some plugin appearances.
  plugin = {
    lualine = {
      -- Bold lualine_a sections
      bold = true,
      -- Don't set section/component backgrounds. Recommended to not set
      -- section/component separators.
      plain = false,
    },
    cmp = { -- works for nvim.cmp and blink.nvim
      -- Don't highlight lsp-kind items. Only the current selection will be highlighted.
      plain = false,
      -- Reverse lsp-kind items' highlights in blink/cmp menu.
      reverse = false,
    },
  },

  -- CUSTOM HIGHLIGHTS --
  --
  -- Override default colors
  colors = {},
  -- Override highlight groups
  highlights = {},
})
-- Convenience function that simply calls `:colorscheme <theme>` with the theme
-- specified in your config.
require("neomodern").load()
```

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

See `neomodern.palette` for color names.

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

## Legacy Support

With the release of `v1`, Neomodern dropped support for the legacy themes COFFEECAT,
DARKFOREST, and DAYLIGHT. If you would still like to use these themes, you can use the
following commit:

```lua
{
    "cdmill/neomodern.nvim",
    commit = "8eecbe1",
    opts = {
        -- your settings here
    }
}
```

## Contributing

Pull requests are welcome.

If you are wanting support for a plugin, either open an issue or submit a pull request
with your highlight additions in [this file](https://github.com/cdmill/neomodern.nvim/blob/main/lua/neomodern/highlights/plugin.lua).

## Inspiration

- [OneDark.nvim](https://github.com/navarasu/onedark.nvim)
- [Bamboo.nvim](https://github.com/ribru17/bamboo.nvim)
- [Catppuccin](https://github.com/catppuccin/nvim)
- [Everforest](https://github.com/sainnhe/everforest)
- [Rosé-Pine](https://github.com/rose-pine/neovim)
- [TokyoNight](https://github.com/folke/tokyonight.nvim)
- [No Clown Fiesta](https://github.com/aktersnurra/no-clown-fiesta.nvim)


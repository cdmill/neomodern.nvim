-- CREDIT: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/extra/init.lua

-- map of plugin name to plugin extension
--- @type table<string, {ext:string, url:string, label:string}>
-- stylua: ignore
local extras = {
  kitty = {ext = "conf", url = "https://sw.kovidgoyal.net/kitty/conf.html", label = "Kitty"},
  fish = {ext = "fish", url = "https://fishshell.com/docs/current/index.html", label = "Fish"},
  fish_themes = {ext = "theme", url = "https://fishshell.com/docs/current/interactive.html#syntax-highlighting", label = "Fish Themes"},
  alacritty = {ext = "toml", url = "https://github.com/alacritty/alacritty", label = "Alacritty"},
  wezterm = {ext = "toml", url = "https://wezfurlong.org/wezterm/config/files.html", label = "WezTerm"},
  foot = {ext = "ini", url = "https://codeberg.org/dnkl/foot", label = "Foot"},
  windows_terminal = {ext = "json", url = "https://aka.ms/terminal-documentation", label = "Windows Terminal"},
  fzf = { ext = "zsh", url = "https://github.com/junegunn/fzf", label = "Fzf"},
}

local function write(str, fileName)
  print("[write] extra/" .. fileName)
  vim.fn.mkdir(vim.fs.dirname("extras/" .. fileName), "p")
  local file = io.open("extras/" .. fileName, "w")
  file:write(str)
  file:close()
end

local neomodern = require("neomodern")
vim.o.background = "dark"

-- map of style to style name
local styles = {
  iceclimber = "iceclimber",
  coffeecat = "coffeecat",
  darkforest = "darkforest",
  campfire = "campfire",
  roseprime = "roseprime",
  daylight = "daylight",
}

-- stylua: ignore
for extra, info in pairs(extras) do
  package.loaded["neomodern.extras." .. extra] = nil
  local plugin = require("neomodern.extras." .. extra)
  for style, style_name in pairs(styles) do
    neomodern.setup({ style = style })
    neomodern.load()
    vim.cmd.colorscheme(style)
    local colors
    if extra == "fzf" then
      colors = require("neomodern.palette")[style_name]
    else
      colors = require("neomodern.terminal").colors()
    end
    local fname = extra .. "/" .. style .. "." .. info.ext
    colors["_upstream_url"] = "https://github.com/cdmill/neomodern.nvim/raw/main/extras/" .. fname
    colors["_style_name"] = "neomodern_" .. style_name
    colors["_name"] = string.upper(style)
    write(plugin.generate(colors), fname)
  end
end

-- CREDIT: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/extra/init.lua

local M = {}

-- map of plugin name to plugin extension
--- @type table<string, {ext:string, url:string, label:string}>
-- stylua: ignore
M.extras = {
  kitty = {ext = "conf", url = "https://sw.kovidgoyal.net/kitty/conf.html", label = "Kitty"},
  fish = {ext = "fish", url = "https://fishshell.com/docs/current/index.html", label = "Fish"},
  fish_themes = {ext = "theme", url = "https://fishshell.com/docs/current/interactive.html#syntax-highlighting", label = "Fish Themes"},
  alacritty = {ext = "toml", url = "https://github.com/alacritty/alacritty", label = "Alacritty"},
  wezterm = {ext = "toml", url = "https://wezfurlong.org/wezterm/config/files.html", label = "WezTerm"},
  foot = {ext = "ini", url = "https://codeberg.org/dnkl/foot", label = "Foot"},
  windows_terminal = {ext = "json", url = "https://aka.ms/terminal-documentation", label = "Windows Terminal"},
  fzf = { ext = "zsh", url = "https://github.com/junegunn/fzf", label = "Fzf"},
  yazi = { ext = "toml", url = "https://github.com/sxyazi/yazi", label = "Yazi"},
}

local function write(str, fname)
  print("[write] extra/" .. fname)
  vim.fn.mkdir(vim.fs.dirname("extras/" .. fname), "p")
  local file = io.open("extras/" .. fname, "w")
  file:write(str)
  file:close()
end

function M.setup()
  local neomodern = require("neomodern")
  vim.o.background = "dark"

  -- map of style to style name
  local themes = {
    iceclimber = "iceclimber",
    coffeecat = "coffeecat",
    darkforest = "darkforest",
    roseprime = "roseprime",
    daylight = "daylight",
  }

  -- stylua: ignore
  for extra, info in pairs(M.extras) do
    package.loaded["neomodern.extras." .. extra] = nil
    local plugin = require("neomodern.extras." .. extra)
    for theme, theme_name in pairs(themes) do
      neomodern.setup({ style = theme })
      neomodern.load()
      local colors = require("neomodern.terminal").colors(true)
      local fname = extra .. "/" .. theme .. "." .. info.ext
      colors["_upstream_url"] = "https://github.com/cdmill/neomodern.nvim/raw/main/extras/" .. fname
      colors["_style_name"] = string.upper(theme_name)
      colors["_name"] = theme
      write(plugin.generate(colors), fname)
    end
  end
end

return M

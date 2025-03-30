local M = {}

---@alias Extra {ext:string, url:string, label:string}

-- map of plugin name to plugin extension
--- @type table<string, Extra>
M.extras = {
    -- stylua: ignore start
    kitty = {ext = "conf", url = "https://sw.kovidgoyal.net/kitty/conf.html", label = "Kitty"},
    fish = {ext = "fish", url = "https://fishshell.com/docs/current/index.html", label = "Fish"},
    fish_themes = {ext = "theme", url = "https://fishshell.com/docs/current/interactive.html#syntax-highlighting", label = "Fish Themes"},
    alacritty = {ext = "toml", url = "https://github.com/alacritty/alacritty", label = "Alacritty"},
    wezterm = {ext = "toml", url = "https://wezfurlong.org/wezterm/config/files.html", label = "WezTerm"},
    foot = {ext = "ini", url = "https://codeberg.org/dnkl/foot", label = "Foot"},
    windows_terminal = {ext = "json", url = "https://aka.ms/terminal-documentation", label = "Windows Terminal"},
    fzf = { ext = "zsh", url = "https://github.com/junegunn/fzf", label = "Fzf"},
    yazi = { ext = "toml", url = "https://github.com/sxyazi/yazi", label = "Yazi"},
    -- stylua: ignore end
}

---@param contents string file contents (extra theme)
---@param fname string filename to save extra
local function write(contents, fname)
    print("[write] extra/" .. fname)
    vim.fn.mkdir(vim.fs.dirname("extras/" .. fname), "p")
    local file = io.open("extras/" .. fname, "w")
    if file then
        file:write(contents)
        file:close()
    end
end

---Generates themes found in the Extras folder. Templates are stored in `neomodern/extras/`.
function M.setup()
    local neomodern = require("neomodern")
    local themes = require("neomodern.palette").themes

    for extra, info in pairs(M.extras) do
        package.loaded["neomodern.extras." .. extra] = nil
        local template = require("neomodern.extras." .. extra)
        for _, theme in pairs(themes) do
            neomodern.colorscheme(theme)
            local palette = require("neomodern.terminal").colors(true)
            local fname = extra .. "/" .. theme .. "." .. info.ext
            local url = "https://github.com/cdmill/neomodern.nvim/raw/main/extras/"
                .. fname
            write(template.generate(palette, url, string.upper(theme)), fname)
        end
    end
end

return M

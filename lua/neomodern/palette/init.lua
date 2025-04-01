local M = {}

---@enum Themes
M.themes = {
    iceclimber = "iceclimber",
    gyokuro = "gyokuro",
    hojicha = "hojicha",
    darkforest = "darkforest",
    roseprime = "roseprime",
    daylight = "daylight",
}

for k, theme in pairs(M.themes) do
    M[k] = require("neomodern.palette." .. theme)
end

return M

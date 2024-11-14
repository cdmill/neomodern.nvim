for k in pairs(package.loaded) do
  if k:match(".*neomodern.*") then
    package.loaded[k] = nil
  end
end

require("neomodern").setup({ theme = "darkforest" })
require("neomodern").colorscheme()

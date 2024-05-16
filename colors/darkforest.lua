for k in pairs(package.loaded) do
  if k:match(".*neomodern.*") then
    package.loaded[k] = nil
  end
end

require("neomodern").setup({ style = "darkforest" })
require("neomodern").colorscheme()

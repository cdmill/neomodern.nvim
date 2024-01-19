for k in pairs(package.loaded) do
  if k:match(".*saguaro.*") then
    package.loaded[k] = nil
  end
end

require("saguaro").setup()
require("saguaro").colorscheme()

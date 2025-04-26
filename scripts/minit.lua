#!/usr/bin/env -S nvim -l

vim.env.LAZY_PATH = vim.fs.normalize("~/Self/Developer/lua")
load(
    vim.fn.system(
        "curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"
    )
)()

require("lazy.minit").setup({
    spec = {
        {
            dir = vim.uv.cwd(),
            opts = {},
        },
    },
})

local now = Config.now

-- Theme =========================================================================
now(function()
    vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })
    vim.cmd.colorscheme("tokyonight-night")

    vim.cmd.hi("Comment gui=none") -- Configure highlights
end)

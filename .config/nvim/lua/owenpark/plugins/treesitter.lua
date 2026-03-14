return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        local filetypes = {
            "bash",
            "c",
            "cpp",
            "diff",
            "go",
            "html",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "query",
            "templ",
            "vim",
            "vimdoc",
        }
        require("nvim-treesitter").install(filetypes)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = filetypes,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}

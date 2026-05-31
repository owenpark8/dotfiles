local now, now_if_args, later, on_filetype = Config.now, Config.now_if_args, Config.later, Config.on_filetype

-- mini =========================================================
later(function()
    require("mini.ai").setup({ n_lines = 500 })
end)

later(function()
    require("mini.pairs").setup({ modes = { insert = true, command = true, terminal = false } })
end)

later(function()
    require("mini.splitjoin").setup()
end)

later(function()
    require("mini.statusline").setup({ use_icons = vim.g.have_nerd_font })
end)

later(function()
    require("mini.surround").setup()
end)

-- todo-comments highlighting =========================================================
later(function()
    vim.pack.add({
        "https://github.com/folke/todo-comments.nvim",
        -- dependencies
        "https://github.com/nvim-lua/plenary.nvim",
    })

    require("todo-comments").setup()
end)

-- Filetype: markdown =========================================================
on_filetype("markdown", function()
    local build = function()
        vim.cmd.packadd("markdown-preview.nvim")
        vim.fn["mkdp#util#install"]()
    end
    Config.on_packchanged("markdown-preview.nvim", { "install", "update" }, build, "Build markdown-preview")
    vim.pack.add({ "https://github.com/iamcco/markdown-preview.nvim" })

    -- Do not close the preview tab when switching to other buffers
    vim.g.mkdp_auto_close = 0
end)

-- indent-blankline
later(function()
    vim.pack.add({ "https://github.com/lukas-reineke/indent-blankline.nvim" })

    require("ibl").setup()
end)

-- nvim-scrollbar
later(function()
    vim.pack.add({ "https://github.com/petertriho/nvim-scrollbar" })
    local colors = require("tokyonight.colors").setup()
    require("scrollbar").setup({
        handle = {
            color = colors.orange,
        },
        marks = {
            Search = { color = colors.bg_dark },
            Error = { color = colors.error },
            Warn = { color = colors.warning },
            Info = { color = colors.info },
            Hint = { color = colors.hint },
            Misc = { color = colors.purple },
        }
    })
end)

-- bigfile
now_if_args(function()
    vim.pack.add({ "https://github.com/folke/snacks.nvim" })

    require("snacks").setup({
        bigfile = {},
    })
end)

-- tmux.nvim
later(function()
    vim.pack.add({ "https://github.com/aserowy/tmux.nvim" })
    require("tmux").setup()
end)

local now, now_if_args, later = Config.now, Config.now_if_args, Config.later
-- nvim-tree =========================================================================
now(function()
    vim.pack.add({
        {
            src = "https://github.com/nvim-tree/nvim-tree.lua",
        },
        "https://github.com/nvim-tree/nvim-web-devicons",
        "https://github.com/nvim-lua/plenary.nvim",
    })

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.keymap.set("n", "\\", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

    local HEIGHT_RATIO = 0.8 -- You can change this
    local WIDTH_RATIO = 0.5 -- You can change this too

    require("nvim-tree").setup({
        disable_netrw = true,
        hijack_netrw = true,
        respect_buf_cwd = true,
        sync_root_with_cwd = true,
        view = {
            relativenumber = true,
            float = {
                enable = true,
                open_win_config = function()
                    local screen_w = vim.opt.columns:get()
                    local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                    local window_w = screen_w * WIDTH_RATIO
                    local window_h = screen_h * HEIGHT_RATIO
                    local window_w_int = math.floor(window_w)
                    local window_h_int = math.floor(window_h)
                    local center_x = (screen_w - window_w) / 2
                    local center_y = ((vim.opt.lines:get() - window_h) / 2)
                        - vim.opt.cmdheight:get()
                    return {
                        border = "rounded",
                        relative = "editor",
                        row = center_y,
                        col = center_x,
                        width = window_w_int,
                        height = window_h_int,
                    }
                end,
            },
            width = function()
                return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
            end,
        }
    })
end)

-- Tree-sitter ================================================================
now_if_args(function()
    local ts_update = function()
        vim.cmd("TSUpdate")
    end
    Config.on_packchanged("nvim-treesitter", { "update" }, ts_update, ":TSUpdate")
    vim.pack.add({
        "https://github.com/nvim-treesitter/nvim-treesitter",
        "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    })

    -- Ensure installed
    --stylua: ignore
    local ensure_languages = {
        'bash', 'c', 'cpp', 'css', 'diff', 'go',
        'html', 'javascript', 'json', 'julia', 'nu', 'php', 'python',
        'r', 'regex', 'rst', 'rust', 'toml', 'tsx', 'typescript', 'yaml',
    }
    local isnt_installed = function(lang)
        return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
    end
    local to_install = vim.tbl_filter(isnt_installed, ensure_languages)
    if #to_install > 0 then
        require("nvim-treesitter").install(to_install)
    end

    -- Ensure enabled
    local filetypes = vim.iter(ensure_languages):map(vim.treesitter.language.get_filetypes):flatten():totable()
    vim.list_extend(filetypes, { "markdown" })
    local ts_start = function(ev)
        vim.treesitter.start(ev.buf)
    end
    Config.new_autocmd("FileType", filetypes, ts_start, "Ensure enabled tree-sitter")
end)

-- Install LSP/formatting/linter executables ==================================
now_if_args(function()
    vim.pack.add({ "https://github.com/mason-org/mason.nvim" })
    require("mason").setup()
end)

-- Formatting =================================================================
later(function()
    vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

    local conform = require("conform")
    conform.setup({
        default_format_opts = {
            -- Allow formatting from LSP server if no dedicated formatter is available
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            lua = { "stylua" },
            cpp = { "clang-format" },
            -- Conform can also run multiple formatters sequentially
            python = { "black" },
            --
            -- You can use a sub-list to tell conform to run *until* a formatter
            -- is found.
            html = { "prettierd" },
            css = { "prettierd" },
            typescript = { "prettierd" },
            typescriptreact = { "prettierd" },
            javascript = { "prettierd" },
            javascriptreact = { "prettierd" },
            markdown = { "prettierd" },
        },
        format_on_save = function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return { timeout_ms = 500, lsp_format = "fallback" }
        end,
    })
end)

-- Language server configurations =============================================
now_if_args(function()
    -- Enable LSP only on Neovim>=0.11 as it introduced `vim.lsp.config`
    if vim.fn.has("nvim-0.11") == 0 then
        return
    end

    vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })
    vim.pack.add({ "https://github.com/mason-org/mason-lspconfig.nvim" })
    vim.pack.add({ "https://github.com/j-hui/fidget.nvim" })
    vim.pack.add({ "https://github.com/saghen/blink.lib" })
    vim.pack.add({ "https://github.com/saghen/blink.cmp" })

    -- LSP servers and clients are able to communicate to each other what features they support.
    --  By default, Neovim doesn't support everything that is in the LSP specification.
    --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
    --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local servers = {
        clangd = {
            cmd = {
                "/usr/bin/clangd",
                "--query-driver=**",
            },
            filetypes = { "c", "cpp", "h", "hpp", "cc" },
        },
        cmake = {},
        pyright = {},
        -- gopls = {},
        rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        buf_ls = {},
        lua_ls = {},
        templ = {},
        ts_ls = {},
        htmx = {},
        html = {},
        marksman = {},
        verible = {},
    }

    -- Ensure the servers and tools above are installed
    require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers or {}),
    })

    for name, server in pairs(servers) do
        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
        vim.lsp.config(name, server)
        vim.lsp.enable(name)
    end
end)

-- Harpoon
later(function()
    vim.pack.add({ {
        src = "https://github.com/ThePrimeagen/harpoon",
        version = "harpoon2"
    } })

    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<leader>hq", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>hw", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>he", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>hr", function() harpoon:list():select(4) end)
    vim.keymap.set("n", "<leader>ht", function() harpoon:list():select(5) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
end)

-- fzf-lua
later(function()
    vim.pack.add({
        "https://github.com/ibhagwan/fzf-lua"
    })
end)

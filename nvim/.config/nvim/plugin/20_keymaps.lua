-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- NOTE: This won't work in all terminal emulators/tmux/etc
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Create `<Leader>` mappings
local nmap_leader = function(suffix, rhs, desc)
    vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
end
local xmap_leader = function(suffix, rhs, desc)
    vim.keymap.set("x", "<Leader>" .. suffix, rhs, { desc = desc })
end

nmap_leader("rw", "<Cmd>Explore<CR>", "Netrw")

local toggle_wrap = function()
    vim.wo.wrap = not vim.wo.wrap
    vim.notify("Wrap " .. (vim.wo.wrap and "enabled" or "disabled"))
end
nmap_leader("lw", toggle_wrap, "Toggle visual wrap")

-- Plugin keymaps =========================================================================
local toggle_autoformat = function()
    if vim.b.disable_autoformat or vim.g.disable_autoformat then
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
        vim.notify("Autoformat enabled")
    else
        vim.g.disable_autoformat = true
        vim.notify("Autoformat disabled")
    end
end
nmap_leader("lf", toggle_autoformat, "Toggle autoformat")

vim.keymap.set("n", "\\", ":Neotree reveal<CR>", { desc = "NeoTree reveal" })

local format = function()
    require("conform").format({ async = true, lsp_fallback = true })
end
nmap_leader("f", format, "[F]ormat buffer")

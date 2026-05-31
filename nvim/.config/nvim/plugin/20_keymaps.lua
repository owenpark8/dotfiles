-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- NOTE: This won't work in all terminal emulators/tmux/etc vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Create `<Leader>` mappings
local nmap_leader = function(suffix, rhs, desc)
    vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
end
local xmap_leader = function(suffix, rhs, desc)
    vim.keymap.set("x", "<Leader>" .. suffix, rhs, { desc = desc })
end

nmap_leader("rw", "<Cmd>Explore<CR>", "Netrw")

-- v is for 'Visual' =========================================================================
local toggle_wrap = function()
    vim.wo.wrap = not vim.wo.wrap
    vim.notify("Wrap " .. (vim.wo.wrap and "enabled" or "disabled"))
end

nmap_leader("vw", toggle_wrap, "Toggle visual wrap")

-- c is for 'Copy' =========================================================================
local copy_absolute_path = function()
    local path = vim.fn.expand("%:p")
    if path == "" then
        vim.notify("No file path for current buffer", vim.log.levels.WARN)
        return
    end

    vim.fn.setreg("+", path)
    vim.notify("Copied: " .. path)
end

local function codex_ref_normal()
    local path = vim.fn.expand('%:.') -- path relative to cwd
    local line = vim.fn.line('.')
    local ref = string.format('@%s#L%d', path, line)
    vim.fn.setreg('+', ref)
    vim.notify('Copied: ' .. ref)
end
local function codex_ref_visual()
    local path = vim.fn.expand('%:.')
    local s = vim.fn.getpos('v')[2] -- where visual started
    local e = vim.fn.getpos('.')[2] -- cursor (other end)
    if s > e then s, e = e, s end
    local ref = s == e
        and string.format('@%s#L%d', path, s)
        or string.format('@%s#L%d-L%d', path, s, e)
    vim.fn.setreg('+', ref)
    vim.notify('Copied: ' .. ref)
end

nmap_leader("cp", copy_absolute_path,   "Copy absolute path")
nmap_leader("cx", codex_ref_normal,     "Copy codex file ref")
xmap_leader("cx", codex_ref_visual,     "Copy codex file ref")

-- l is for 'Language' =========================================================================
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
vim.g.disable_autoformat = true

nmap_leader("lF", toggle_autoformat,                                                                "Format-on-save toggle")
nmap_leader("lf", "<Cmd>lua require('conform').format({ async = true, lsp_fallback = true })<CR>",  "Format")
nmap_leader("lr", "<Cmd>lua vim.lsp.buf.rename()<CR>",                                              "LSP Rename")

xmap_leader("lf", "<Cmd>lua require('conform').format({ async = true, lsp_fallback = true })<CR>", "Format selection")

-- f is for 'Fuzzy Find' =========================================================================
nmap_leader("fr", "<Cmd>FzfLua resume<CR>",             "Resume find")
nmap_leader("ff", "<Cmd>FzfLua files<CR>",              "Find files")
nmap_leader("fg", "<Cmd>FzfLua live_grep<CR>",          "Live grep")
nmap_leader("fG", "<Cmd>FzfLua live_grep_native<CR>",   "Live native grep")
nmap_leader("fw", "<Cmd>FzfLua grep_cword<CR>",         "Grep word")
nmap_leader("fW", "<Cmd>FzfLua grep_cWORD<CR>",         "Grep WORD")


vim.g.mapleader      = ' ' -- Use `<Space>` as a leader key

-- UI =========================================================================
vim.g.have_nerd_font = true
vim.o.wrap           = false                  -- Don't visually wrap lines (toggle with <Leader>lw)
vim.o.breakindent    = true                   -- Indent wrapped lines to match line start
vim.o.breakindentopt = 'list:-1'              -- Add padding for lists (if 'wrap' is set)
vim.o.cursorline     = true                   -- Enable current line highlighting
vim.o.linebreak      = true                   -- Wrap lines at 'breakat' (if 'wrap' is set)
vim.o.list           = true                   -- Show helpful text indicators
vim.opt.listchars    = { tab = "» ", lead = "·", trail = "·", nbsp = "␣" }
vim.o.showmode       = false                  -- Don't show mode in command line
vim.o.signcolumn     = 'yes'                  -- Always show signcolumn (less flicker)
vim.o.splitbelow     = true                   -- Horizontal splits will be below
vim.o.splitright     = true                   -- Vertical splits will be to the right
vim.o.splitkeep      = 'screen'               -- Reduce scroll during window split
vim.o.scrolloff      = 15                     -- Minimal number of screen lines to keep above and below the cursor
vim.o.nu             = true                   -- "Hybrid" line numbers
vim.o.relativenumber = true                   -- "Hybrid" line numbers
vim.o.colorcolumn    = ''                     -- Remove vertical color column
vim.api.nvim_create_autocmd("TextYankPost", { -- Highlight on yank
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Editing ====================================================================
vim.o.smartindent = true          -- Make indenting smart
vim.o.autoindent  = true          -- Use auto indent
vim.o.expandtab   = true          -- Convert tabs to spaces
vim.o.tabstop     = 4             -- Show tab as this number of spaces
vim.o.softtabstop = 4
vim.o.shiftwidth  = 4             -- Use this number of spaces for indentation
vim.o.virtualedit = 'block'       -- Allow going past end of line in blockwise mode
vim.o.clipboard   = "unnamedplus" -- Sync clipboard between OS and Neovim.


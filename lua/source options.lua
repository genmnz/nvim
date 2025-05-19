vim.g.maplocalleader = ","

vim.opt.mouse = 'a'
vim.opt.ignorecase = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = false
vim.opt.smartcase = false
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true
vim.g.background = "light"

-- Set color for the current line number (vibrant red)
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#af5f5f" })
--vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff0000", bold = true })

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

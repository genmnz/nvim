-- Disable treesitter compiler warnings before any other code runs
vim.g.ts_nocheck = true
vim.g.nvim_treesitter_no_c_compiler = true
vim.g.loaded_treesitter = true

-- Set up error handling for startup
local status_ok = true
local function safe_require(module)
  status_ok, _ = pcall(require, module)
  if not status_ok then
    vim.notify('Error loading ' .. module, vim.log.levels.WARN)
  end
end

-- Load core modules with error handling
safe_require('options')
safe_require('plugins')
safe_require('colorscheme')
safe_require('lsp')
safe_require('keymaps')

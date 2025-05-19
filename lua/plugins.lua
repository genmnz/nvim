local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Explicit plugin specs you want to always include
local extra_plugins = {
  "bluz71/vim-moonfly-colors",
  --[["fnune/standard",
  lazy = false,
  priority = 1000,
  config = function()
    require("standard").setup({})
    vim.cmd("colorscheme standard")
  end,]]
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = { documentation = { auto_show = false } },
      sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {}
    end,
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
}

-- Dynamically require all plugin spec files from lua/plugins/*.lua
local plugin_specs = {}
local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
local plugin_files = vim.fn.globpath(plugin_dir, "*.lua", false, true)

for _, file in ipairs(plugin_files) do
  local filename = vim.fn.fnamemodify(file, ":t:r")
  if filename ~= "plugins" then
    local ok, specs = pcall(require, "plugins." .. filename)
    if ok and specs then
      if type(specs) == "table" then
        if specs[1] ~= nil then
          for _, spec in ipairs(specs) do
            table.insert(plugin_specs, spec)
          end
        else
          table.insert(plugin_specs, specs)
        end
      end
    end
  end
end

-- Combine extra_plugins and plugin_specs
for _, spec in ipairs(plugin_specs) do
  table.insert(extra_plugins, spec)
end

require("lazy").setup(extra_plugins)

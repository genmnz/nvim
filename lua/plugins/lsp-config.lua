return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = {
        "ts_ls",    -- TypeScript/JavaScript
        "html",
        "cssls",
        "jsonls",
        "lua_ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      -- Using ts_ls for TypeScript/JavaScript (tsserver is deprecated)
      lspconfig.ts_ls.setup({ capabilities = capabilities })         -- TypeScript/JavaScript
      lspconfig.html.setup({ capabilities = capabilities })          -- HTML
      lspconfig.cssls.setup({ capabilities = capabilities })         -- CSS
      lspconfig.jsonls.setup({ capabilities = capabilities })        -- JSON
      lspconfig.lua_ls.setup({ capabilities = capabilities })        -- Lua
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

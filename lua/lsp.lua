-- Mason setup
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- Mason-LSPConfig setup
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'ts_ls', 'html', 'cssls', 'jsonls' },
})

-- LSPConfig
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Diagnostic keymaps
local opts_diag = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts_diag)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts_diag)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts_diag)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts_diag)

-- on_attach function
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

-- Configure LSP servers
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false, -- Avoid issues with sumneko_lua_ls_nightly
            },
            -- Do not send telemetry data containing server info (project path etc.)
            telemetry = {
                enable = false,
            },
        }
    }
})

lspconfig.ts_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig.html.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig.cssls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig.jsonls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- This file is loaded via require('lsp') in init.lua.
-- It needs to return a table for pcall to work correctly if init.lua uses it.
return {}
    
local colorscheme = 'catppuccin'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    -- Fallback to a default that's likely to exist
    vim.cmd("colorscheme habamax")
    vim.notify('Fallback to default colorscheme')
end

-- Create autocmd to set highlights after colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        -- Set cursor to match text color - use blend to inherit color
        vim.api.nvim_set_hl(0, "Cursor", { blend = 100, reverse = true })
        -- Make cursor line visible but subtle
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#303030" })
        -- Line number highlights
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff9e64", bold = true }) 
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#737373" })
    end
})

-- Apply cursor highlights immediately
vim.api.nvim_set_hl(0, "Cursor", { blend = 100, reverse = true })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#303030" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff9e64", bold = true })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#737373" })

-- Make cursor inherit color of text it's on
vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"

-- Enable cursorline and make it more visible
vim.opt.cursorline = true

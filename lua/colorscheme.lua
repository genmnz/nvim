local colorscheme = 'moonfly'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
-- Create autocmd to set highlights after colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff0000", bold = true }) -- Vibrant red for current line
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff" }) -- Faded red for other lines af5f5f
    end
})

-- Apply highlights immediately as well
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff0000", bold = true })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff" })

-- Enable cursorline
vim.opt.cursorline = true

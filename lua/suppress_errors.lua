-- This file contains code to suppress C compiler errors at startup

-- Set global variables to disable treesitter and parser compilation
vim.g.nvim_treesitter_no_warn = 1
vim.g.ts_nocheck = true
vim.g.loaded_treesitter = true
vim.g.nvim_treesitter_no_c_compiler = true

-- Define a function to suppress C compiler error messages
local function suppress_c_compiler_errors()
  -- Override the error notification function temporarily during startup
  local original_notify = vim.notify
  vim.notify = function(msg, level, opts)
    -- Filter out C compiler messages
    if type(msg) == "string" and msg:match("No C compiler found") then
      return
    end
    -- Pass other messages to the original notify function
    return original_notify(msg, level, opts)
  end

  -- Restore original notify after startup is complete
  vim.defer_fn(function()
    vim.notify = original_notify
  end, 3000)
end

-- Call the suppression function
suppress_c_compiler_errors()

return {}
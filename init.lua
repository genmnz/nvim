-- Load error suppression before anything else
require('suppress_errors')

-- Set up error handling for startup
local function safe_require(module)
  local status_ok, err = pcall(require, module)
  if not status_ok then
    -- Only show non-C compiler errors
    if type(err) == "string" and not err:match("No C compiler found") then
      vim.notify('Error loading ' .. module .. ': ' .. err, vim.log.levels.WARN)
    end
  end
end

-- Load core modules with error handling
safe_require('options')
safe_require('plugins')
safe_require('colorscheme')
safe_require('lsp')
safe_require('keymaps')

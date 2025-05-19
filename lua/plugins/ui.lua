return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function(_, opts)
      local logo = [[
    ██╗    ███╗███████╗██╗      █████╗ ██████╗ 
    ████╗ ████║██╔════╝██║     ██╔══██╗██╔══██╗
    ██╔████╔██║█████╗  ██║     ███████║██║  ██║
    ██║╚██╔╝██║██╔══╝  ██║     ██╔══██║██║  ██║
    ██║ ╚═╝ ██║███████╗███████╗██║  ██║██████╔╝
    ╚═╝     ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═════╝ 

      ]]
      opts.config = opts.config or {}
      opts.config.header = vim.split(logo, "\n")
      opts.config.center = {
        { action = "Telescope find_files", desc = " Find File", icon = "󰈞 ", key = "f" },
        { action = "ene | startinsert", desc = " New File", icon = "󰈔 ", key = "n" },
        { action = "Telescope oldfiles", desc = " Recent Files", icon = "󰋚 ", key = "r" },
        { action = "Telescope live_grep", desc = " Find Text", icon = "󰈢 ", key = "g" },
        { action = "qa", desc = " Quit", icon = "󰅚 ", key = "q" },
      }
    end,
  },
} 
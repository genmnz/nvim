return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      -- Keymaps for gitsigns
      -- (add your custom keymaps here if needed)
    end,
  }
}

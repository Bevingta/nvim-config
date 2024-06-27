return { 
  {
    "tpope/vim-fugitive",
  },
  {
  "lewis6991/gitsigns.nvim",
  cofig = function()
    require("gitsigns").setup()
  end,
  }
}

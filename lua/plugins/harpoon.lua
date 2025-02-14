return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>ha",
      ":lua require('harpoon.mark').add_file()<CR>",
      desc = "Add file to harpoon",
    },
    {
      "<leader>hu",
      ":Telescope harpoon marks<CR>",
      desc = "Toggle harpoon telscope",
    },
    {
      "<leader>hn",
      ":lua require('harpoon.ui').nav_next()<CR>",
      desc = "Harpoon nav next",
    },
    {
      "<leader>hN",
      ":lua require('harpoon.ui').nav_prev()<CR>",
      desc = "Harpoon nav prev",
    },
  },
  opts = function()
    require("harpoon").setup({})
    require("telescope").load_extension("harpoon")
  end,
}

return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "ha",
      ":lua require('harpoon.mark').add_file()<CR>",
      desc = "Add file to harpoon",
    },
    {
      "hu",
      ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
      desc = "Toggle harpoon quick menu",
    },
    {
      "hn",
      ":lua require('harpoon.ui').nav_next()<CR>",
      desc = "Harpoon nav next",
    },
    {
      "hp",
      ":lua require('harpoon.ui').nav_prev()<CR>",
      desc = "Harpoon nav prev",
    },
    {
      "h1",
      ":lua require('harpoon.ui').nav_file(1)<CR>",
      desc = "Harpoon nav file 1",
    },
    {
      "h2",
      ":lua require('harpoon.ui').nav_file(2)<CR>",
      desc = "Harpoon nav file 2",
    },
    {
      "h3",
      ":lua require('harpoon.ui').nav_file(3)<CR>",
      desc = "Harpoon nav file 3",
    },
    {
      "h4",
      ":lua require('harpoon.ui').nav_file(4)<CR>",
      desc = "Harpoon nav file 4",
    },
    {
      "h5",
      ":lua require('harpoon.ui').nav_file(5)<CR>",
      desc = "Harpoon nav file 5",
    },
  },
  opts = function()
    require("harpoon").setup({})
    require("telescope").load_extension("harpoon")
  end,
}

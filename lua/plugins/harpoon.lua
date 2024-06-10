return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("harpoon").setup({})
    require("telescope").load_extension("harpoon")

    local keymap = vim.keymap
    keymap.set("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", { desc = "Add file to harpoon" })
    keymap.set("n", "<leader>hu", ":Telescope harpoon marks<CR>", { desc = "Toggle harpoon telscope" })
    keymap.set("n", "<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>", { desc = "Harpoon nav next" })
    keymap.set("n", "<leader>hN", ":lua require('harpoon.ui').nav_prev()<CR>", { desc = "Harpoon nav prev" })
  end,
}

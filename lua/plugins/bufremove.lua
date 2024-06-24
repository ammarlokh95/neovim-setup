return {
  "echasnovski/mini.bufremove",
  version = "*",
  config = function()
    require("mini.bufremove").setup()
    vim.keymap.set("n", "<leader>bd", ":lua MiniBufremove.delete(0)<CR>", { desc = "Remove buffer" })
  end,
}

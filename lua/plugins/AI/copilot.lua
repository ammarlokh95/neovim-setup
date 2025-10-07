return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set("i", "<S-Right>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })
    vim.keymap.set("n", "<leader>cod", ":Copilot disable<cr>", { desc = "Disable copilot" })
    vim.keymap.set("n", "<leader>coe", ":Copilot enable<cr>", { desc = "Enable copilot" })
    vim.g.copilot_no_tab_map = true
  end,
}

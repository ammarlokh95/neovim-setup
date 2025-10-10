return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    vim.keymap.set("n", "<leader>cod", ":Copilot disable<cr>", { desc = "Disable copilot" })
    vim.keymap.set("n", "<leader>coe", ":Copilot enable<cr>", { desc = "Enable copilot" })
    vim.g.copilot_no_tab_map = true
    require("copilot").setup({
      suggestion = {
        keymap = {
          accept = "<S-Right>",
          dismiss = "<S-Left>",
        },
      },
    })
  end,
}

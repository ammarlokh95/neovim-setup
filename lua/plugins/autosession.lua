return {
  "rmagatti/auto-session",
  config = function()
    local autosession = require("auto-session")
    autosession.setup({
      auto_restore_enabled = false,
      auto_save_enabled = true,
      auto_session_creation_enabled = true,
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
    })
    local keymap = vim.keymap
    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session" })
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session" })
  end,
}

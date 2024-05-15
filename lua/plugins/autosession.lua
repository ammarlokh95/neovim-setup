return {
  "rmagatti/auto-session",
  config = function()
    local autosession = require("auto-session")
    autosession.setup({
      auto_restore_enabled = true,
      auto_save_enabled = true,
      auto_session_creation_enabled = true,
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
    })
  end,
}

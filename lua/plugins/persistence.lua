return {
  "folke/persistence.nvim",
  event = "VimEnter",
  opts = {
    -- add any custom options here
  },
  config = function(_, opts)
    require("persistence").setup(opts)
    -- load the session for the current directory
    vim.keymap.set("n", "<leader>qr", function()
      require("persistence").load()
    end, { desc = "Load session for cwd" })
    -- select a session to load
    vim.keymap.set("n", "<leader>qs", function()
      require("persistence").select()
    end, { desc = "Select session to load" })
    -- load the last session
    vim.keymap.set("n", "<leader>ql", function()
      require("persistence").load({ last = true })
    end, { desc = "Load last session" })
    -- stop Persistence => session won't be saved on exit
    vim.keymap.set("n", "<leader>qd", function()
      require("persistence").stop()
    end, { desc = "Don't save session on exit" })
  end,
}

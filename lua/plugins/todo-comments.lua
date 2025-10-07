return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>st",
      function()
        require("snacks").picker.todo_comments()
      end,
      desc = "Todo",
    },
    {
      "<leader>sT",
      function()
        require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
      end,
      desc = "Todo/Fix/Fixme",
    },
  },
  config = function()
    local todo_comments = require("todo-comments")
    local keymap = vim.keymap
    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Jump to next todo comment" })
    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Jump to previous todo comment" })
    todo_comments.setup()
  end,
}

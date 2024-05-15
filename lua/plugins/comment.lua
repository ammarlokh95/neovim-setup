return {
  "numToStr/Comment.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  depencencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local comment = require("Comment")
    local ts_context_commentstring = require("nvim-ts-context-commentstring")

    comment.setup({
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}

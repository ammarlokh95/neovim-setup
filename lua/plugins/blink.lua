return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets", "folke/sidekick.nvim" },
  version = "1.*",
  opts = {
    keymap = {
      preset = "enter",
    },
    completion = {
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
    },
  },
}

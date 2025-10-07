return {
  "saghen/blink.cmp",
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion.list = {
        preselect = true,
        auto_insert = false,
    },
    keymap = {
      ["<S-Right>"] = {
        "snippet_forward",
        function() -- sidekick next edit suggestion
        
          return require("sidekick").nes_jump_or_apply()
        end,
        function() -- if you are using Neovim's native inline completions
          return vim.lsp.inline_completion.get()
        end,
        "fallback",
      },
    },
  },
}

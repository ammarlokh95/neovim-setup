return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      -- ensure_installed = {
      --   "json",
      --   "typescript",
      --   "javascript",
      --   "html",
      --   "yaml",
      --   "css",
      --   "markdown",
      --   "markdown_inline",
      --   "lua",
      --   "bash",
      --   "vim",
      --   "dockerfile",
      --   "gitignore",
      --   "query",
      --   "vimdoc",
      --   "c_sharp",
      --   "git_config",
      --   "jsdoc",
      --   "python",
      --   "regex",
      --   "scss",
      -- },
      auto_install = false,
      ignore_install = {},
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-s>", -- set to `false` to disable one of the mappings
          node_incremental = "<C-s>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}

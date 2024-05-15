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
      ensure_installed = {
        "json",
        "typescript",
        "javascript",
        "html",
        "tsx",
        "yaml",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "lua",
        "graphql",
        "bash",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c_sharp",
        "git_config",
        "jsdoc",
        "python",
        "regex",
        "scss",
        "terraform",
      },
      sync_install = false,
      auto_install = true,
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

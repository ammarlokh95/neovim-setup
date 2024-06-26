return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  opts = {
    -- LazyVim will use these options when formatting with the conform.nvim formatter
    format = {
      timeout_ms = 3000,
      async = false, -- not recommended to change
      quiet = false, -- not recommended to change
      lsp_fallback = true, -- not recommended to change
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    ---@type table<string, conform.FormatterUnit[]>
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      html = { "prettierd" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      scss = { "prettierd" },
      css = { "prettierd" },
      cs = { "csharpier" },
    },
    -- The options you set here will be merged with the builtin formatters.
    -- You can also define any custom formatters here.
    ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
    formatters = {
      injected = { options = { ignore_errors = true } },
    },
  },
}

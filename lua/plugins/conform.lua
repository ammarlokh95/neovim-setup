return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  config = function()
    local opts = {
      -- LazyVim will use these options when formatting with the conform.nvim formatter
      format = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback",
      },
      format_on_save = {
        timeout_ms = 3000,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        html = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        scss = { "prettier" },
        css = { "prettier" },
      },
      -- Set the log level. Use `:ConformInfo` to see the location of the log file.
      log_level = vim.log.levels.ERROR,
      -- Conform will notify you when a formatter errors
      notify_on_error = true,

      -- The options you set here will be merged with the builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string, table|fun(bufnr: integer): nil|table>
      formatters = {
        injected = { options = { ignore_errors = true } },
      },
    }

    require("conform").setup(opts)
  end,
}

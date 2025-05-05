return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ timeout_ms = 3000 })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  config = function()
    local opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        html = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        scss = { "prettier" },
        css = { "prettier" },
        cpp = { "clang-format" },
        cs = { "csharpier" },
        python = { "black" },
      },
      -- Set the log level. Use `:ConformInfo` to see the location of the log file.
      log_level = vim.log.levels.ERROR,
      -- Conform will notify you when a formatter errors
      notify_on_error = true,

      -- The options you set here will be merged with the builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string, table|fun(bufnr: integer): nil|table>
      formatters = {
        injected = {
          options = {
            -- Set to true to ignore errors
            ignore_errors = false,
            -- Map of treesitter language to filetype
            lang_to_ft = {
              bash = "sh",
            },
            -- Map of treesitter language to file extension
            -- A temporary file name with this extension will be generated during formatting
            -- because some formatters care about the filename.
            lang_to_ext = {
              bash = "sh",
              c_sharp = "cs",
              elixir = "exs",
              javascript = "js",
              julia = "jl",
              latex = "tex",
              markdown = "md",
              python = "py",
              ruby = "rb",
              rust = "rs",
              teal = "tl",
              typescript = "ts",
            },
            -- Map of treesitter language to formatters to use
            -- (defaults to the value from formatters_by_ft)
            lang_to_formatters = {},
          },
        },
        csharpier = {
          inherit = false,
          format_on_save = false,
          command = "csharpier",
          args = { "format", "$FILENAME", "--write-stdout" },
        },
      },
    }

    require("conform").setup(opts)
  end,
}

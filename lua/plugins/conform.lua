return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ timeout_ms = 3000, lsp_format = "fallback" })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
    {
      "<leader>cxf",
      function()
        -- If autoformat is currently disabled for this buffer,
        -- then enable it, otherwise disable it
        if vim.b.disable_autoformat then
          vim.cmd("FormatEnable")
          vim.notify("Enabled autoformat for current buffer")
        else
          vim.cmd("FormatDisable!")
          vim.notify("Disabled autoformat for current buffer")
        end
      end,
      desc = "Toggle autoformat for current buffer",
    },
    {
      "<leader>cxF",
      function()
        -- If autoformat is currently disabled globally,
        -- then enable it globally, otherwise disable it globally
        if vim.g.disable_autoformat then
          vim.cmd("FormatEnable")
          vim.notify("Enabled autoformat globally")
        else
          vim.cmd("FormatDisable")
          vim.notify("Disabled autoformat globally")
        end
      end,
      desc = "Toggle autoformat globally",
    },
  },
  config = function()
    local opts = {
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return {
          timeout_ms = 500,
          lsp_fallback = true,
        }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        html = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        md = { "prettier" },
        markdown = { "prettier" },
        json = { "prettier" },
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
          command = "csharpier",
          args = { "format", "$FILENAME", "--write-stdout" },
          stdin = true,
        },
      },
    }

    require("conform").setup(opts)

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- :FormatDisable! disables autoformat for this buffer only
        vim.b.disable_autoformat = true
      else
        -- :FormatDisable disables autoformat globally
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true, -- allows the ! variant
    })

    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })
  end,
}

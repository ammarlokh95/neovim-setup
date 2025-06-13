return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "artemave/workspace-diagnostics.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "nvim-tree/nvim-web-devicons",
    "ibhagwan/fzf-lua",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config("*", { capabilities = capabilities })

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = {
        "angularls",
        "dockerls",
        "vtsls",
        "html",
        "csharp_ls",
        "cssls",
        "lua_ls",
        "jsonls",
        "somesass_ls",
        "yamlls",
        "zls",
        "bashls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "eslint_d", -- eslint daemon
      },
    })

    vim.keymap.set("n", "<leader>cm", ":Mason<cr>", { desc = "Mason" })

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = signs.Error,
          [vim.diagnostic.severity.WARN] = signs.Warn,
          [vim.diagnostic.severity.HINT] = signs.Hint,
          [vim.diagnostic.severity.INFO] = signs.Info,
        },
      },
      {
        linehl = {
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          [vim.diagnostic.severity.WARN] = "WarnMsg",
          [vim.diagnostic.severity.HINT] = "HintMsg",
          [vim.diagnostic.severity.INFO] = "InfoMsg",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          [vim.diagnostic.severity.WARN] = "WarnMsg",
          [vim.diagnostic.severity.HINT] = "HintMsg",
          [vim.diagnostic.severity.INFO] = "InfoMsg",
        },
      },
    })

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", function()
          vim.fn.printf("Restarting lsp...")
          vim.lsp.stop_client(vim.lsp.get_clients())
          vim.cmd("edit")
        end, opts) -- mapping to restart lsp if necessary

        opts.desc = "Go to next quickfix item"
        keymap.set("n", "<leader>cn", "<cmd>cnext<CR>", opts) -- go to next quickfix item

        opts.desc = "Go to previous quickfix item"
        keymap.set("n", "<leader>cp", "<cmd>cprevious<CR>", opts) -- go to previous quickfix item
      end,
    })

    vim.api.nvim_set_keymap("n", "<space>xw", "", {
      noremap = true,
      callback = function()
        for _, client in ipairs(vim.lsp.buf_get_clients()) do
          require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
        end
      end,
    })
  end,
}

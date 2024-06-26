return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = {
        "angularls",
        "dockerls",
        "tsserver",
        "html",
        "cssls",
        "lua_ls",
        "pyright",
        "omnisharp",
        "jsonls",
        "somesass_ls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettierd", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- eslint daemon
      },
    })
    vim.keymap.set("n", "<leader>cm", ":Mason<cr>", { desc = "Mason" })
  end,
}

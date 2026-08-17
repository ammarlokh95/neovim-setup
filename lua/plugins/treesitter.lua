-- nvim-treesitter `main` branch.
--
-- The `master` branch is frozen and explicitly does not support Neovim 0.12
-- (its query directives still use the pre-0.12 single-node match format, which
-- makes every injection parse throw inside the highlighter). `main` is a full
-- rewrite: it only installs parsers/queries, and the features themselves are
-- enabled per-buffer below.
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false, -- `main` does not support lazy-loading
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter")

    treesitter.setup()

    -- No-op for parsers that are already installed and up to date.
    treesitter.install({
      "angular",
      "bash",
      "c_sharp",
      "css",
      "dockerfile",
      "git_config",
      "gitignore",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "razor",
      "regex",
      "scss",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "zig",
    })

    -- `main` no longer enables anything itself. Highlighting comes from Neovim
    -- (`vim.treesitter.start`), indentation from this plugin. Folds are already
    -- wired up globally via `foldexpr` in config/options.lua.
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_enable", { clear = true }),
      callback = function(ev)
        local lang = vim.treesitter.language.get_lang(ev.match)
        -- `language.add` returns nil when no parser is installed for `lang`,
        -- which keeps us from starting treesitter on unsupported filetypes.
        if not lang or not vim.treesitter.language.add(lang) then
          return
        end

        if pcall(vim.treesitter.start, ev.buf, lang) then
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}

if vim.g.vscode then
  -- vscode extensions
  print("init lua")
  require("config.keymaps_vscode")
  require("config.autocmds")
  require("config.options")
else
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
  require("config.options")
  require("config.keymaps")
  require("config.autocmds")
end

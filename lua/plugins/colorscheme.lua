return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      custom_highlights = function(colors)
        local u = require("catppuccin.utils.colors")
        return {
          LineNr = {
            fg = colors.lavender,
          },
          CursorLineNr = {
            fg = colors.red,
            bg = u.lighten(colors.blue, 0.8),
          },
        }
      end,
    })
    vim.cmd("colorscheme catppuccin")
  end,
}

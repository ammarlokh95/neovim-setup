local catppuccin = {
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

local kanagawa = {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",
  priority = 1000,
  config = function()
    require("kanagawa").setup({})
    vim.cmd("colorscheme kanagawa")
  end,
}

local rosepine = {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      variant = "moon",
      styles = {
        bold = true,
        italic = false,
        transparency = false,
      },
      highlight_groups = {
        TelescopePromptNormal = { bg = "base" },
        TelescopeResultsNormal = { fg = "subtle", bg = "none" },
        TelescopeSelection = { fg = "text", bg = "base" },
        TelescopeSelectionCaret = { fg = "rose", bg = "rose" },

        CurSearch = { fg = "base", bg = "rose", inherit = false },
        Search = { fg = "text", bg = "rose", blend = 20, inherit = false },

        Cursor = { fg = "text", bg = "love", inherit = false },
        Visual = { fg = "base", bg = "rose", inherit = false },
      },
    })
    vim.cmd("colorscheme rose-pine")
  end,
}

return rosepine

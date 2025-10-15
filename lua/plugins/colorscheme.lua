return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    local p = {
      moon = {
        base = "#002240",
        overlay = "#0d233d",
        surface = "#062852",
      },
    }
    require("rose-pine").setup({
      variant = "moon",
      palette = p,
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

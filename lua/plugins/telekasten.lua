return {
  "renerocksai/telekasten.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-telekasten/calendar-vim" },
  keys = {
    -- Launch panel if nothing is typed after <leader>z
    { "<leader>z", "<cmd>Telekasten panel<CR>" },

    -- Most used functions
    { "<leader>zf", "<cmd>Telekasten find_notes<CR>" },
    { "<leader>zg", "<cmd>Telekasten search_notes<CR>" },
    { "<leader>zd", "<cmd>Telekasten goto_today<CR>" },
    { "<leader>zz", "<cmd>Telekasten follow_link<CR>" },
    { "<leader>zn", "<cmd>Telekasten new_note<CR>" },
    { "<leader>zb", "<cmd>Telekasten show_backlinks<CR>" },
    { "<leader>zI", "<cmd>Telekasten insert_img_link<CR>" },

    -- Call insert link automatically when we start typing a link
    { "[[", "<cmd>Telekasten insert_link<CR>" },
  },
  config = function()
    local home = vim.fn.expand("C:/Users/alokhandwala/notes/")
    require("telekasten").setup({
      home = home,
    })
  end,
}

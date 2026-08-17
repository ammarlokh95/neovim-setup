-- The keymaps here used to call the harpoon 1 API (`harpoon.mark`, `harpoon.ui`)
-- against the `harpoon2` branch, where those modules no longer exist, and `opts`
-- loaded a telescope extension that isn't installed.
local function list()
  return require("harpoon"):list()
end

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  config = function(_, opts)
    -- Required by harpoon2: it registers its own autocmds here.
    require("harpoon"):setup(opts)
  end,
  keys = {
    {
      "<leader>ha",
      function()
        list():add()
      end,
      desc = "Add file to harpoon",
    },
    {
      "<leader>hu",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Toggle harpoon quick menu",
    },
    {
      "<leader>hn",
      function()
        list():next()
      end,
      desc = "Harpoon nav next",
    },
    {
      "<leader>hp",
      function()
        list():prev()
      end,
      desc = "Harpoon nav prev",
    },
    {
      "<leader>h1",
      function()
        list():select(1)
      end,
      desc = "Harpoon nav file 1",
    },
    {
      "<leader>h2",
      function()
        list():select(2)
      end,
      desc = "Harpoon nav file 2",
    },
    {
      "<leader>h3",
      function()
        list():select(3)
      end,
      desc = "Harpoon nav file 3",
    },
    {
      "<leader>h4",
      function()
        list():select(4)
      end,
      desc = "Harpoon nav file 4",
    },
    {
      "<leader>h5",
      function()
        list():select(5)
      end,
      desc = "Harpoon nav file 5",
    },
  },
}

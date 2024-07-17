return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
        overrides = {
          notes_subdir = "0_Inbox",
        },
      },
      {
        name = "work",
        path = "~/vaults/work",
      },
    },

    daily_notes = {
      date_format = "%a, %d, %m %Y",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily-notes" },
      template = nil,
    },
    templates = {
      folder = "~/vaults/templates",
      date_format = "%a, %d, %m %Y",
      time_format = "%H:%M",
    },
  },
  keys = {
    { "<leader>ol", ":lua require('obsidian')<cr>", desc = "Load obsidian.nvim" },
    { "<leader>on", "<cmd>ObsidianToday<cr>", desc = "New daily note" },
    { "<leader>od", "<cmd>ObsidianDailies<cr>", desc = "New daily note" },
    { "<leader>ow", "<cmd>ObsidianWorkspace work<cr>", desc = "Obsidian work workspace" },
    { "<leader>op", "<cmd>ObsidianWorkspace personal<cr>", desc = "Obsidian personal workspace" },
    { "<leader>op", "<cmd>ObsidianWorkspace personal<cr>", desc = "Obsidian personal workspace" },
    { "<leader>fon", "<cmd>ObsidianSearch<cr>", desc = "Search obsidian notes" },
    { "<leader>fot", "<cmd>ObsidianTags<cr>", desc = "Search obsidian notes" },
    { "<leader>oe", "<cmd>ObsidianExtractNote<cr>", mode = "x", desc = "Extract note" },
    { "<leader>o>", "<cmd>ObsidianLink<cr>", mode = "x", desc = "Extract note" },
  },
}

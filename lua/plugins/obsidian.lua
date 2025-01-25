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
    },
    templates = {
      folder = "~/vaults/templates",
      date_format = "%a, %d, %m %Y",
      time_format = "%H:%M",
    },

    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,
    -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
    -- way then set 'mappings = {}'.
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },
  },
  keys = {
    { "<leader>ol", ":lua require('obsidian')<cr>", desc = "Load obsidian.nvim" },
    { "<leader>ond", "<cmd>ObsidianToday<cr>", desc = "Create a new daily note" },
    {
      "<leader>onn",
      function()
        local title = vim.fn.input("Enter note title: ")
        return "<cmd>ObsidianNewFromTemplate " .. title .. "<cr>"
      end,
      desc = "Create a new note from template",
    },
    { "<leader>od", "<cmd>ObsidianDailies<cr>", desc = "Open a new daily note" },
    { "<leader>ow", "<cmd>ObsidianWorkspace work<cr>", desc = "Obsidian work workspace" },
    { "<leader>op", "<cmd>ObsidianWorkspace personal<cr>", desc = "Obsidian personal workspace" },
    { "<leader>off", "<cmd>ObsidianSearch<cr>", desc = "Search obsidian notes" },
    { "<leader>oft", "<cmd>ObsidianTags<cr>", desc = "Search obsidian notes for tag" },
    { "<leader>oe", "<cmd>ObsidianExtractNote<cr>", mode = "x", desc = "Extract note" },
    { "<leader>o>", "<cmd>ObsidianLink<cr>", mode = "x", desc = "Search selected and link note" },
    { "<leader>o]", "<cmd>ObsidianFollowLink<cr>", desc = "Follow a note reference" },
  },
}

-- `epwalsh/obsidian.nvim` is archived (last release v3.9.0, July 2024). This is
-- the maintained community fork.
--
-- Two things changed with the move:
--   * commands are now `:Obsidian <subcommand>`. The old `ObsidianToday` style
--     names still work while `legacy_commands` is true, but that option goes
--     away in 4.0.0, so they are spelled the new way below.
--   * the `mappings` option is deprecated and has no effect. `<CR>`
--     (smart_action) and `]o` / `[o` (next/prev link) are now buffer-local
--     defaults in vault notes -- set `vim.g.obsidian_default_keymap = false` to
--     turn those off. Note `]o` shadows the treesitter-textobjects loop motion
--     inside vault notes.
--
-- `date_format` / `time_format` still accept strftime as well as moment.js
-- tokens, so the formats below are unchanged.
return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    legacy_commands = false,

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
  },
  keys = {
    { "<leader>ol", ":lua require('obsidian')<cr>", desc = "Load obsidian.nvim" },
    { "<leader>ond", "<cmd>Obsidian today<cr>", desc = "Create a new daily note" },
    {
      "<leader>onn",
      function()
        local title = vim.fn.input("Enter note title: ")
        if title == "" then
          return
        end
        vim.cmd("Obsidian new_from_template " .. title)
      end,
      desc = "Create a new note from template",
    },
    { "<leader>od", "<cmd>Obsidian dailies<cr>", desc = "Open a new daily note" },
    { "<leader>ow", "<cmd>Obsidian workspace work<cr>", desc = "Obsidian work workspace" },
    { "<leader>op", "<cmd>Obsidian workspace personal<cr>", desc = "Obsidian personal workspace" },
    { "<leader>off", "<cmd>Obsidian search<cr>", desc = "Search obsidian notes" },
    { "<leader>oft", "<cmd>Obsidian tags<cr>", desc = "Search obsidian notes for tag" },
    { "<leader>oe", "<cmd>Obsidian extract_note<cr>", mode = "x", desc = "Extract note" },
    { "<leader>o>", "<cmd>Obsidian link<cr>", mode = "x", desc = "Search selected and link note" },
    { "<leader>o]", "<cmd>Obsidian follow_link<cr>", desc = "Follow a note reference" },
    -- Was the `mappings` entry for `<leader>ch`.
    { "<leader>ch", "<cmd>Obsidian toggle_checkbox<cr>", desc = "Toggle checkbox" },
  },
}

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggle_term = require("toggleterm")
    -- `vim.fn.has()` returns 0/1, and 0 is truthy in Lua, so this used to always
    -- pick pwsh; `vim.os.shell` never existed either.
    local sh = vim.fn.has("win32") == 1 and "pwsh" or vim.o.shell
    -- A second setup() call replaces the config wholesale rather than merging,
    -- so the highlights have to go into this call.
    toggle_term.setup({
      size = 20,
      open_mapping = "<leader>td",
      insert_mappings = false,
      direction = "horizontal",
      shell = sh,
      highlights = require("rose-pine.plugins.toggleterm"),
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      dir = "git_dir",
      direction = "float",
      float_opts = {
        border = "double",
      },
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end,
      -- function to run on closing the terminal
      on_close = function(_)
        vim.cmd("startinsert!")
      end,
    })

    function Lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap(
      "n",
      "<leader>tlg",
      "<cmd>lua Lazygit_toggle()<CR>",
      { noremap = true, silent = true, desc = "Toggle lazygit" }
    )
  end,
}

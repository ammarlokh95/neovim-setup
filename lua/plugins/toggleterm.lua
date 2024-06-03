return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggle_term = require("toggleterm")
    local sh = vim.fn.has("win32") and "powershell" or vim.os.shell
    toggle_term.setup({
      size = 20,
      open_mapping = "<leader>td",
      insert_mappings = false,
      direction = "horizontal",
      shell = sh,
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

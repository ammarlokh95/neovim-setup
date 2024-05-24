-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.set({ "i", "v", "n" }, "jk", "<Esc>", { desc = "jk to <Esc>" })
keymap.set("t", "jk", "<C-\\><C-n>", { desc = "terminal mode jk to <C-\\><C-n>" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { noremap = true, silent = true, desc = "Clear highlights" })
-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { silent = true, desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>wv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical split" })
keymap.set("n", "<leader>wh", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal split" })
keymap.set("n", "<leader>we", "<C-W>", { noremap = true, silent = true, desc = "Equalize splits" })
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { noremap = true, silent = true, desc = "Close current splits" })

-- tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", { noremap = true, silent = true, desc = "New tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { noremap = true, silent = true, desc = "Close tab" })
keymap.set("n", "<leader>th", ":tabprev<CR>", { noremap = true, silent = true, desc = "Previous tab" })
keymap.set("n", "<leader>tl", ":tabnext<CR>", { noremap = true, silent = true, desc = "Next tab" })
keymap.set(
  "n",
  "<leader>tf",
  "<cmd>tabnew %<CR>",
  { noremap = true, silent = true, desc = "Open current buffer in new tab" }
)

-- attaches multple split screens to scroll together
keymap.set("n", "<leader>wb", ":set scrollbind<CR>", { desc = "Scrollbind current buffer" })
keymap.set("n", "<leader>wnb", ":set noscrollbind<CR>", { desc = "Disable scrollbind" })

keymap.set("n", "oo", "o<Esc>", { desc = "Insert new line below" })
keymap.set("n", "OO", "O<Esc>", { desc = "Insert new line above" })

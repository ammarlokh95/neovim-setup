-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>", { noremap = true, desc = "jk to <Esc>" })
keymap.set("v", "jk", "<Esc>", { noremap = true, desc = "jk to <Esc>" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { noremap = true, silent = true, desc = "Clear highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { noremap = true, silent = true, desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { noremap = true, silent = true, desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical split" })
keymap.set("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal split" })
keymap.set("n", "<leader>se", "C-W>=", { noremap = true, silent = true, desc = "Equalize splits" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { noremap = true, silent = true, desc = "Close current splits" })

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

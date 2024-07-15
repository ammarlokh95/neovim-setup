local map = vim.keymap

map.set({ "i", "v", "n" }, "jk", "<Esc>", { desc = "jk to <Esc>" })
map.set("t", "jk", "<C-\\><C-n>", { desc = "terminal mode jk to <C-\\><C-n>" })
map.set("n", "<leader>nh", ":nohl<CR>", { noremap = true, silent = true, desc = "Clear highlights" })
-- increment/decrement numbers
map.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map.set("n", "<leader>-", "<C-x>", { silent = true, desc = "Decrement number" })

-- window management
map.set("n", "<leader>wv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical split" })
map.set("n", "<leader>wh", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal split" })
map.set("n", "<leader>we", "<C-W>", { noremap = true, silent = true, desc = "Equalize splits" })
map.set("n", "<leader>wx", "<cmd>close<CR>", { noremap = true, silent = true, desc = "Close current splits" })
map.set("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })

-- attaches multple split screens to scroll together
map.set("n", "<leader>wb", ":set scrollbind<CR>", { desc = "Scrollbind current buffer" })
map.set("n", "<leader>wnb", ":set noscrollbind<CR>", { desc = "Disable scrollbind" })

map.set("n", "oo", "o<Esc>", { desc = "Insert new line below" })
map.set("n", "OO", "O<Esc>", { desc = "Insert new line above" })
map.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor on page up" })
map.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor on page down" })

-- better up/down
map.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- buffers
map.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Clear search with <esc>
map.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map.set(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
map.set("i", ",", ",<c-g>u")
map.set("i", ".", ".<c-g>u")
map.set("i", ";", ";<c-g>u")

-- save file
map.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
map.set("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

-- commenting
map.set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map.set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
map.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

map.set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map.set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start

-- toggle options
map.set("n", "<leader>uf", function() vim.format.toggle() end, { desc = "Toggle Auto Format (Global)" })
map.set("n", "<leader>us", function() vim.toggle("spell") end, { desc = "Toggle Spelling" })
map.set("n", "<leader>uw", function() vim.toggle("wrap") end, { desc = "Toggle Word Wrap" })
map.set("n", "<leader>ud", function() vim.toggle.diagnostics() end, { desc = "Toggle Diagnostics" })
if vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint then
  map.set( "n", "<leader>uh", function() vim.toggle.inlay_hints() end, { desc = "Toggle Inlay Hints" })
end
map.set("n", "<leader>uT", function() if vim.b.ts_highlight then vim.treesitter.stop() else vim.treesitter.start() end end, { desc = "Toggle Treesitter Highlight" })

-- quit
map.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
map.set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map.set("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

-- Terminal Mappings
map.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map.set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
map.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map.set("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- tabs
map.set("n", "<leader><tab>L", "<cmd>tablast<cr>", { desc = "Last Tab" })
map.set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map.set("n", "<leader><tab>F", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map.set("n", "<leader><tab>l", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map.set("n", "<leader><tab>h", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- return {
--   "FabijanZulj/blame.nvim",
--   keys = {
--     { "<leader>gb", "<cmd>BlameToggle window<cr>", desc = "Open blame panel" },
--   },
--   config = function()
--     require("blame").setup()
--   end,
-- }
return {
  "f-person/git-blame.nvim",
  opts = { enabled = true, gitblame_schedule_event = "CursorHold", gitblame_clear_event = "CursorHoldI" },
}

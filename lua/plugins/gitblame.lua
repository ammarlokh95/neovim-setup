-- return {
--   "FabijanZulj/blame.nvim",
--   keys = {
--     { "<leader>gb", "<cmd>BlameToggle window<cr>", desc = "Open blame panel" },
--   },
--   config = function()
--     require("blame").setup()
--   end,
-- }
return { "f-person/git-blame.nvim", config = true }

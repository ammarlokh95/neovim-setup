return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*",
  config = true,
}

-- ys{motion}{char} = surround
-- ds{char} = delete surround
-- cs{char}{new_char} = change surrougg
-- HTML - ys{motion}t = <tag>surround</tag>

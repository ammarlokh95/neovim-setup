-- nvim-treesitter-textobjects `main` branch (its `master` is frozen too).
--
-- `main` drops the `nvim-treesitter.configs` module system: only `select` and
-- `move` behaviour is configured via `setup`, and every text object / motion is
-- a plain keymap onto the select / move / swap modules.
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  -- Neovim's built-in ftplugins define buffer-local `]m`, `[m`, `]]` … for some
  -- filetypes, which shadow the global maps below. Uncomment to disable them.
  -- init = function()
  --   vim.g.no_plugin_maps = true
  -- end,
  config = function()
    require("nvim-treesitter-textobjects").setup({
      select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
      },
      move = {
        set_jumps = true, -- whether to set jumps in the jumplist
      },
    })

    local select = require("nvim-treesitter-textobjects.select")
    local move = require("nvim-treesitter-textobjects.move")
    local map = vim.keymap.set

    -- selection
    ---@param key string
    ---@param query string|string[]
    ---@param group string
    ---@param desc string
    local function sel(key, query, group, desc)
      map({ "x", "o" }, key, function()
        select.select_textobject(query, group)
      end, { desc = desc })
    end

    sel("af", "@function.outer", "textobjects", "Select outer function")
    sel("if", "@function.inner", "textobjects", "Select inner function")
    sel("ac", "@class.outer", "textobjects", "Select outer class")
    sel("ic", "@class.inner", "textobjects", "Select inner class")
    sel("aS", "@block.outer", "textobjects", "Select outer block")
    sel("iS", "@block.inner", "textobjects", "Select inner block")
    -- `@scope` was never a real capture; the scope object lives in `locals.scm`.
    sel("as", "@local.scope", "locals", "Select scope")

    -- movement
    ---@param key string
    ---@param fn fun(query: string|string[], group: string)
    ---@param query string|string[]
    ---@param group string
    ---@param desc string
    local function mv(key, fn, query, group, desc)
      map({ "n", "x", "o" }, key, function()
        fn(query, group)
      end, { desc = desc })
    end

    mv("]m", move.goto_next_start, "@function.outer", "textobjects", "Next function start")
    mv("]]", move.goto_next_start, "@class.outer", "textobjects", "Next class start")
    -- `main` takes a list instead of the old `@loop.*` regex form.
    mv("]o", move.goto_next_start, { "@loop.inner", "@loop.outer" }, "textobjects", "Next loop start")
    mv("]s", move.goto_next_start, "@local.scope", "locals", "Next scope")
    mv("]z", move.goto_next_start, "@fold", "folds", "Next fold")

    mv("]M", move.goto_next_end, "@function.outer", "textobjects", "Next function end")
    mv("][", move.goto_next_end, "@class.outer", "textobjects", "Next class end")

    mv("[m", move.goto_previous_start, "@function.outer", "textobjects", "Prev function start")
    mv("[[", move.goto_previous_start, "@class.outer", "textobjects", "Prev class start")

    mv("[M", move.goto_previous_end, "@function.outer", "textobjects", "Prev function end")
    mv("[]", move.goto_previous_end, "@class.outer", "textobjects", "Prev class end")

    -- Go to either the start or the end, whichever is closer.
    mv("]d", move.goto_next, "@conditional.outer", "textobjects", "Next conditional")
    mv("[d", move.goto_previous, "@conditional.outer", "textobjects", "Prev conditional")

    local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
    map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

    -- vim way: ; goes to the direction you were moving.
    -- map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    -- map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    map({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
    map({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
    map({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
    map({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
  end,
}

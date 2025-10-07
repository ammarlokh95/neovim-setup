return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      [[                                                 ]],
      [[                                                 ]],
      [[                    _                            ]],
      [[                () | | o                         ]],
      [[                /\ | |     __   _                ]],
      [[               /  \|/  |  /    |/                ]],
      [[              /(__/|__/|_/\___/|__/              ]],
      [[                                __               ]],
      [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
      [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
      [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }
    dashboard.section.buttons.val = {
      dashboard.button("a", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("ff", "󰈞  Find file", ":lua require('snacks').picker.find_files()<CR>"),
      dashboard.button("r", "  Restore session", ":lua require('persistence').load()<CR>"),
      dashboard.button("fr", "󰊄  Recent files", ":lua require('snacks').picker.recent()<CR>"),
      dashboard.button("fw", "󰈬  Search word", ":lua require('snacks').picker.grep()<CR>"),
      dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
    }
    local handle = io.popen("fortune")
    local fortune = handle:read("*a")
    handle:close()
    dashboard.section.footer.val = fortune

    dashboard.config.opts.noautocmd = true

    vim.cmd([[autocmd User AlphaReady echo 'ready']])

    alpha.setup(dashboard.config)
  end,
}

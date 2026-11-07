return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({

				base00 = '#0f1416',
				base01 = '#171d1e',
				base02 = '#1b2122',
				base03 = '#899294',
				base0B = '#fff572',
				base04 = '#e2edf0',
				base05 = '#f8fdff',
				base06 = '#f8fdff',
				base07 = '#f8fdff',
				base08 = '#ff9fbf',
				base09 = '#ff9fbf',
				base0A = '#a1eafb',
				base0C = '#cef5ff',
				base0D = '#a1eafb',
				base0E = '#b3f0ff',
				base0F = '#b3f0ff',
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}

return {
	{
		"rose-pine/neovim",
		priority = 1000,
		config = function()
			require('rose-pine').setup({
				--- @usage 'auto'|'main'|'moon'|'dawn'
				variant = 'auto',
				--- @usage 'main'|'moon'|'dawn'
				dark_variant = 'moon',
				bold_vert_split = false,
				dim_nc_background = true,
				disable_background = true,
				disable_float_background = true,
				disable_italics = main,

				--- @usage string hex value or named color from rosepinetheme.com/palette
				groups = {
					background = 'base',
					background_nc = '_experimental_nc',
					panel = 'surface',
					panel_nc = 'base',
					border = 'highlight_med',
					comment = 'muted',
					link = 'iris',
					punctuation = 'subtle',

					error = 'love',
					hint = 'iris',
					info = 'foam',
					warn = 'gold',

					headings = {
						h1 = 'iris',
						h2 = 'foam',
						h3 = 'rose',
						h4 = 'gold',
						h5 = 'pine',
						h6 = 'foam',
					}
					-- or set all headings at once
					-- headings = 'subtle'
				},

				-- Change specific vim highlight groups
				-- https://github.com/rose-pine/neovim/wiki/Recipes
				highlight_groups = {
					-- ColorColumn = { bg = 'muted', blend = 10 },
					-- 6E6A86 (comments, line numbers)
					ColorColumn = { fg = 'muted', bg = 'muted' },
					-- Blend colours against the "base" background
					CursorLine = { bg = 'foam' },
					StatusLine = { fg = 'love', bg = 'love', blend = 10 },

					-- By default each group adds to the existing config.
					-- If you only want to set what is written in this config exactly,
					-- you can set the inherit option:
					Search = { bg = 'gold', inherit = false },
				}
			})

			-- Set colorscheme after options
			vim.cmd('colorscheme rose-pine')
		end,
	},
	{
		"github/copilot.vim",
	},
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup({
				global_settings = {
					save_on_toggle = true,
					save_on_change = true,
				},
			})
		end,
	},
	{
		'nvim-telescope/telescope-file-browser.nvim',
		config = function()
			require('telescope').setup({
				extensions = {
					file_browser = {
						theme = "ivy",
						layout_config = {
							width = 100,
							height = 100,
						},
						hijack_netrw = true,
						hidden = true,
						mappings = {
							["i"] = {
								-- custom insert mode mappings
							},
							["n"] = {
								-- custom normal mode mappings
							},
						},
					},
				},
			})
		end,
	},
	{
		'startup-nvim/startup.nvim',
		config = function()
			require('startup').setup({
				theme = "startify",
			})
		end
	},
	{ 'xiyaowong/transparent.nvim' }
	-- { 'ThePrimeagen/git-worktree.nvim' },
	--{
	--'kristijanhusak/vim-dadbod-ui',
	--dependencies = {
	--{ 'tpope/vim-dadbod', lazy = true },
	--{
	--	'kristijanhusak/vim-dadbod-completion',
	--	ft = { 'mongodb', 'sql', 'mysql', 'plsql' },
	--	lazy = true
	--},
	--},
	--	cmd = {
	--		'DBUI',
	--		'DBUIToggle',
	--		'DBUIAddConnection',
	--		'DBUIFindBuffer',
	--	},
	--	init = function()
	--		-- Your DBUI configuration
	--		vim.g.db_ui_use_nerd_fonts = 1
	--	end,
	--}
}

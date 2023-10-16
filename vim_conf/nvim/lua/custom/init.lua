return {
	{
		"rose-pine/neovim",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				-- You can uncomment and set your preferred variant here
				-- variant = "main",
				-- variant = "dawn",
				variant = "moon",
			})
			vim.cmd([[colorscheme rose-pine]])
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
							width = 100, -- 100% width
							height = 100, -- 100% height
						},
						-- use instead of netrw
						hijack_netrw = true,
						mappings = {
							["i"] = {
								-- your custom insert mode mappings
							},
							["n"] = {
								-- your custom normal mode mappings
							},
						},
					},
				},
			})
		end,
	},
	{ 'ThePrimeagen/git-worktree.nvim' },
	{
		'VonHeikemen/fine-cmdline.nvim',
		dependencies = {
			{ 'MunifTanjim/nui.nvim', lazy = true },
		},
		config = function()
			require('fine-cmdline').setup({
				popup = {
					position = {
						row = '50%',
						col = '50%',
					},
					size = {
						width = '50%',
					},
					border = {
						style = 'rounded',
					},
					win_options = {
						winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
					},
				},
			})
		end,

	},
	{ 'voldikss/vim-floaterm' },
	{ 'xiyaowong/transparent.nvim' },
	{
		'kristijanhusak/vim-dadbod-ui',
		dependencies = {
			{ 'tpope/vim-dadbod', lazy = true },
			{
				'kristijanhusak/vim-dadbod-completion',
				ft = { 'mongodb', 'sql', 'mysql', 'plsql' },
				lazy = true
			},
		},
		cmd = {
			'DBUI',
			'DBUIToggle',
			'DBUIAddConnection',
			'DBUIFindBuffer',
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
	{
		'eandrju/cellular-automaton.nvim',
	}
}

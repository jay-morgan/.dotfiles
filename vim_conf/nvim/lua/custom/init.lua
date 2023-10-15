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
	{ 'ThePrimeagen/git-worktree.nvim' },
	{
		'VonHeikemen/fine-cmdline.nvim',
		dependencies = {
			{ 'MunifTanjim/nui.nvim', lazy = true },
		}

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

return {
	{
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				color_overrides = {},
				custom_highlights = {},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})

			vim.cmd.colorscheme "catppuccin"
		end
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
		end
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

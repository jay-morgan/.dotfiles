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
}

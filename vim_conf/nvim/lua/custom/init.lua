return {
	-- Options
	scrolloff = 9,
	relativenumber = true,
	softtabstop = 4,
	shiftwidth = 4,
	smarttab = true,
	autoindent = true,

	-- Add a custom line for a transparent background
	{ "hi Normal guibg=NONE ctermbg=NONE" },

	-- Add a margin
	{ "set colorcolumn=120" },

	-- Key mappings
	{ "n",                                "<leader>pv", ":Vex<CR>", { noremap = true } },

	-- Plugins
	{
		"rose-pine/neovim",
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
}

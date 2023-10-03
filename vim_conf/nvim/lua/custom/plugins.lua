vim.opt.scrolloff = 8         -- set scrolloff=8
vim.opt.relativenumber = true -- set relativenumber
--vim.opt.tabstop = 4             -- set tabstop=4
--vim.opt.softtabstop = 4         -- set softtabstop=4
--vim.opt.shiftwidth = 4          -- set shiftwidth=4
--vim.opt.expandtab = true        -- set expandtab
--vim.opt.smartindent = true      -- set smartindent

-- key mappings
vim.api.nvim_set_keymap('n', '<leader>pv', ':Vex<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>', { noremap = true })

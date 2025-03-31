vim.g.mapleader = ' '

-- NvimTree keymaps
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', opts) -- Toggle file explorer (NvimTree)
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>', opts) -- Find file in NvimTree

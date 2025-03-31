vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- NvimTree keymaps
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', opts) -- Toggle file explorer (NvimTree)
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>', opts) -- Find file in NvimTree


-- Yank to global clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })

--Telescope Options

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })


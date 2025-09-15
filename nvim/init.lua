vim.cmd([[set noswapfile]])
vim.opt.tabstop = 2
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.o.winborder = "rounded"


vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { src = "https://github.com/hrsh7th/cmp-buffer" },
  { src = "https://github.com/hrsh7th/cmp-path" },
})

require('mason').setup()
require('mini.pick').setup()
require('oil').setup()
require('nvim-autopairs').setup()
require('nvim-tree').setup()
require('nvim-treesitter').setup()

-- colorscheme
require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")

-- lsp

--vim.lsp.enable(
--	{
--		"lua_ls",
	--	"pyright",
	--}
--)

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

local servers = {"pyright", "lua_ls", "jdtls", "clangd", "texlab"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({ capabilities = capabilities })
end

local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
})




-- keybinds
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.localleader = " "
vim.g.mapleader = " "
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>lf', vim.lsp.buf.format)
map('n', '<leader>o', ':Oil<CR>')
map('n', '<leader>h', ':<Cmd>Pick help<CR>')
map('n', '<leader>f', ':<Cmd>Pick files<CR>')
map('n', '<leader>w', ':set wrap!<CR>')
map({'n', 'v', 'x'}, '<leader>y', '"+y', opts)
map('i', '<c-e>', function() vim.lsp.completion.get() end)

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.signcolumn = 'yes'
vim.g.mapleader = ' '

local indent_width = 4
vim.o.shiftwidth = indent_width
vim.o.tabstop = indent_width
vim.o.softtabstop = indent_width
vim.o.expandtab = true

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<Enter>', function() 
    for i = 1, vim.v.count do
        vim.cmd.norm('2j')
    end
end)

vim.keymap.set('n', '<C-x>', function()
    return '<cmd>echo ' .. vim.v.count .. '<CR>' end, { expr = true })
vim.keymap.set('n', '<C-z>', function()	print('hi' .. vim.v.count) end)

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<C-N>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set({ 'n', 'v' }, '<C-_>', function()
    vim.cmd.norm('gcc') end, { remap = true })

vim.pack.add({
    {src = 'https://github.com/catppuccin/nvim'},
    {src = 'https://github.com/numToStr/Comment.nvim'},
    {src = 'https://github.com/neovim/nvim-lspconfig'},
    {src = 'https://github.com/nvim-mini/mini.pairs'},
    {src = 'https://github.com/nvim-tree/nvim-tree.lua'},
})

require('mini.pairs').setup()
require('nvim-tree').setup()
require('Comment').setup()

vim.lsp.enable({'lua_ls'})

vim.cmd('colorscheme catppuccin')
vim.cmd('hi statusline guibg=NONE')

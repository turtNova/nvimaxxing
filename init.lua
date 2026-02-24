vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.signcolumn = 'yes'
vim.g.mapleader = ' '

local indent_width = 4
vim.opt.shiftwidth = indent_width
vim.opt.tabstop = indent_width
vim.opt.softtabstop = indent_width
vim.opt.expandtab = true
vim.opt.listchars = { trail = '⋅' }
-- vim.opt.listchars = { space = '_', eol = '¬', tab = '<->' }
vim.opt.list = true

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Enter to enter an empty line below
vim.keymap.set('n', '<Enter>', function()
    if vim.v.count == 0 then
        vim.cmd.norm('o')
    end
    for i = 1, vim.v.count do
        vim.cmd.norm('o')
    end
end)

-- Enter to enter an empty line above
vim.keymap.set('n', '<S-Enter>', function()
    if vim.v.count == 0 then
        vim.cmd.norm('O')
    end
    for i = 1, vim.v.count do
        vim.cmd.norm('O')
    end
end)

vim.keymap.set('n', '<C-x>', function()
    return '<cmd>echo ' .. vim.v.count .. '<CR>' end,
    { expr = true })
vim.keymap.set('n', '<C-z>', function()
    print('hi' .. vim.v.count) end)

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>x', ':bdelete<CR>', { silent = true })
vim.keymap.set('n', '<C-N>', ':NvimTreeToggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set({ 'n', 'v' }, '<C-_>', function()
    vim.cmd.norm('gcc') end, { remap = true })
vim.keymap.set('i', 'jk', '<ESC>')

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
-- vim.cmd('hi statusline guibg=NONE')

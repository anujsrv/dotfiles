vim.g.mapleader = ' '

vim.keymap.set('n', '<C-j>', ':m +1<CR>', {noremap = true})
vim.keymap.set('n', '<C-k>', ':m -2<CR>', {noremap = true})
vim.keymap.set('i', '<C-j>', '<Esc>:m +1<CR>gi', {noremap = true})
vim.keymap.set('i', '<C-k>', '<Esc>:m -2<CR>gi', {noremap = true})
vim.keymap.set('v', '<C-j>', ':m \'>+1<CR>gvgv', {noremap = true})
vim.keymap.set('v', '<C-k>', ':m \'<-2<CR>gvgv', {noremap = true})

vim.keymap.set('n', '<C-s>', ':w<CR>', {noremap = false})
vim.keymap.set('n', '<C-q>', ':q<CR>', {noremap = false})

vim.keymap.set('n', '<leader>q', ':Bdelete<CR>', {noremap = true})
vim.keymap.set('n', '<leader>nu', ':set nu!<CR>', {noremap = true})
-- vim.keymap.set('n', '<leader>vi', ':edit ~/.config/nvim/init.lua<CR>', {noremap = true})

vim.keymap.set('n', '<leader>at', ':ALEToggle<CR>', {noremap = true})
vim.keymap.set('n', '<leader>nt', ':NERDTreeToggle<CR>', {noremap = true})
vim.keymap.set('n', '<leader>nf', ':NERDTreeFind<CR>', {noremap = true})

vim.keymap.set('n', '<leader>gd', ':Git diff<CR>', {noremap = true})
vim.keymap.set('n', '<leader>gs', ':Git<CR>', {noremap = true})

vim.keymap.set('n', '<leader>tag', ':TagbarToggle<CR>', {noremap = true})

vim.keymap.set('n', '<leader>t', ':bnext<CR>', {noremap = true})
vim.keymap.set('n', '<leader>T', ':bprev<CR>', {noremap = true})

-- vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<CR>', {noremap = true})
-- vim.keymap.set('n', 'gb', '<cmd>Telescope buffers<CR>', {noremap = true})
vim.keymap.set('n', '<C-p>', ':FZF<CR>', {noremap = true})
vim.keymap.set('n', 'gb', ':Buffers<CR>', {noremap = true})

vim.keymap.set('n', 'gmb', ':Dispatch mint build<CR>', {noremap = true})
vim.keymap.set('n', '<leader>rbc', ':Dispatch git-review create -r', {noremap = true})
vim.keymap.set('n', '<leader>rbu', ':Dispatch git-review update<CR>', {noremap = true})

vim.keymap.set('n', '[q', ':cprev<CR>', {noremap = true})
vim.keymap.set('n', ']q', ':cnext<CR>', {noremap = true})

local autocmd = vim.api.nvim_create_autocmd 
local cmd = vim.api.nvim_create_user_command

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hlsearch = true

vim.opt.mouse = 'a'

vim.cmd [[let test#strategy = "dispatch"]]

-- fzf settings
vim.g.fzf_layout = { window = { width = 0.9, height = 0.9 } }
vim.cmd [[let $FZF_DEFAULT_OPTS="--bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,ctrl-f:preview-top,ctrl-l:preview-bottom"]]
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit',
}
vim.g.fzf_preview_window = {'right:60%'}

autocmd('VimEnter', {
    pattern = '*',
    command = 'command! -bang -nargs=? -complete=dir FZF call fzf#vim#files(<q-args>, fzf#vim#with_preview({"options": ["--info=inline", "--border"]}), <bang>0)'
})

cmd('Rrg', 'command! -bang -nargs=* Rg call fzf#vim#grep("rg -u --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)', {})

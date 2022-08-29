function LspInstall(language)
    local cmd = '~/.vim/installer/lsp-installers.sh ' .. language
    local out = vim.fn.system(cmd)
    vim.cmd('echom', out)
end
vim.api.nvim_command("command! -nargs=* LspInstall call luaeval('LspInstall(_A)', expand('<q-args>'))")


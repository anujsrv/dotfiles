vim.api.nvim_create_user_command("LspInstall", function() 
    local language = vim.fn.input('language (supported: go, java, python): ')
    local cmd = '~/.vim/installer/lsp-installers.sh ' .. language
    local bufnr = vim.api.nvim_create_buf(false, true)
    vim.cmd"botright split"
    vim.cmd("buffer "..bufnr)
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {"installation stdout/stderr: (please wait for installation to complete)"} )
    local echo_out = function(_, data)
        if data then
            vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
        end
    end
    vim.fn.jobstart(cmd, {
        stdout_buffered = true,
        on_stdout = echo_out,
        on_stderr = echo_out
    })
end, {})

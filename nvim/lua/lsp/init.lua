require("lsp.installer")

local lsp_installation_dir = os.getenv('HOME') .. '/.local/share/installed-lsp-servers/'

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>eq', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)

  vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.go", "*.py" },
      callback = function()
        vim.lsp.buf.format(nil, 3000)
      end,
  })
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go", "*.py" },
    callback = function()
      local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
      params.context = {only = {"source.organizeImports"}}
  
      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
      for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
          else
            vim.lsp.buf.execute_command(r.command)
          end
        end
      end
    end,
  })
end

require("lspconfig").gopls.setup{
  cmd = {lsp_installation_dir .. 'gopls'},
  filetypes = { 'go' },
  on_attach = on_attach
}

require("lspconfig").jdtls.setup{
  cmd = {lsp_installation_dir .. 'eclipse-jdtls/bin/jdtls',
        '-data', '/tmp/',
        '-configuration', lsp_installation_dir .. 'eclipse-jdtls/config_linux'},
  filetypes = { 'java' },
  on_attach = on_attach
}

require("lspconfig").pyright.setup{
  cmd = {lsp_installation_dir .. 'pyright-langserver', '--stdio'},
  filetypes = { 'python' },
  on_attach = on_attach
}

require("lspconfig").rust_analyzer.setup{
    cmd = { "rustup", "run", "stable", "rust-analyzer" }
}

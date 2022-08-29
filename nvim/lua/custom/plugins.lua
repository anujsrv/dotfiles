local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'

-- colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'

-- run async builds and test suites
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
-- for running tests
Plug 'vim-test/vim-test'

-- for linting + as a LSP client
-- Plug 'dense-analysis/ale'
Plug 'ackyshake/VimCompletesMe'
Plug 'neovim/nvim-lspconfig'

-- minimalistic auto-completion
-- Plug 'ajh17/VimCompletesMe'

Plug 'tpope/vim-surround'
Plug 'preservim/tagbar'
Plug 'unblevable/quick-scope'
Plug 'moll/vim-bbye'

-- telescope.nvim
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

vim.call('plug#end')


local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

vim.cmd [[set rtp+=~/.fzf]]
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
-- Plug 'vim-airline/vim-airline'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim'
-- Plug 'airblade/vim-gitgutter'

-- colorschemes
Plug 'nanotech/jellybeans.vim'
-- Plug 'morhetz/gruvbox'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'EdenEast/nightfox.nvim'
Plug 'rebelot/kanagawa.nvim'

-- run async builds and test suites
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
-- for running tests
Plug 'vim-test/vim-test'

-- for linting + as a LSP client
-- Plug 'dense-analysis/ale'
Plug 'ackyshake/VimCompletesMe'
Plug 'neovim/nvim-lspconfig'

-- copilot
Plug 'github/copilot.vim'

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
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'

vim.call('plug#end')


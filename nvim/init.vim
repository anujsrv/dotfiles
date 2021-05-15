set nocompatible              " be iMproved, required
set exrc
set secure
set encoding=utf-8
filetype off                  " required

set backspace=indent,eol,start
set expandtab shiftwidth=4 tabstop=4
syntax on
set hidden
set nu
set relativenumber
set hlsearch
set scrolloff=8

set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1

call plug#begin('~/.vim/plugged')
set rtp+=~/.fzf

Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'

" colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'

" run async builds and test suites
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
" for running tests
Plug 'vim-test/vim-test'

" for linting + as a LSP client
Plug 'dense-analysis/ale'

" minimalistic auto-completion
Plug 'ajh17/VimCompletesMe'

Plug 'preservim/tagbar'
Plug 'unblevable/quick-scope'
Plug 'moll/vim-bbye'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" All of your Plugins must be added before the following line

call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

let g:airline_symbols_ascii = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

set background=dark
colorscheme gruvbox

" http://github.com/scrooloose/nerdtree/issues/489
let g:NERDTreeDirArrows = 1
"let g:NERDTreeDirArrowExpandable = '>'
"let g:NERDTreeDirArrowCollapsible = '<'
"let g:NERDTreeGlyphReadOnly = "RO"

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
set statusline+=%#warningmsg#
set statusline+=%*
set laststatus=2

" ale configs
let g:ale_open_list = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
let g:ale_open_list = 'on_save'
" set list with errors size
let g:ale_list_window_size = 5
" enable hightlights for errors
let g:ale_set_highlights = 1

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" to enable ALE logging
" let g:ale_echo_msg_format = '[%linter%] %code: %%s'
" call ch_logfile(expand('/tmp/chlogfile.log'), 'w')

let g:ale_linters = {
\   'python': ['flake8', 'pyright'],
\   'go': ['govet', 'gopls'],
\   'c': ['clang'],
\   'java': ['eclipselsp'],
\}

let g:ale_go_gopls_executable = $HOME . '/.local/share/installed-lsp-servers/gopls'
let g:ale_python_pyright_executable = $HOME . '/.local/share/installed-lsp-servers/pyright-langserver'
" need to start vim with venv activated
let g:ale_python_pyright_config = {
\ 'python': {
\   'venvPath': $VIRTUAL_ENV,
\ },
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'go': ['gofmt'],
\}

let test#strategy = "dispatch"
let test#python#runner = 'pytest'
let test#java#runner = 'gradletest'
let test#java#gradletest#executable = 'ligradle test'

let g:dispatch_compilers = {
\ 'pytest': 'pylint',
\ 'ligradle test': 'gradle',
\}

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

function! FZFOpen(cmd)
    " If more than 1 window, and buffer is not modifiable or file type is
    " NERD tree or Quickfix type
    if winnr('$') > 1 && (!&modifiable || &ft == 'nerdtree' || &ft == 'qf')
        " Move one window to the right, then up
        wincmd l
        wincmd k
    endif
    exe a:cmd
endfunction

let g:fzf_layout = { 'down': '40%' }
let g:fzf_action = {
  \ 'return': 'edit',
  \ 'ctrl-t': 'tabedit',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_preview_window = 'right:60%'
autocmd! VimEnter *  command! -bang -nargs=? -complete=dir FZF call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
nnoremap <C-p> :call FZFOpen(':FZF')<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg -u --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


" custom keybindings
nnoremap <C-j> :m +1<CR>
nnoremap <C-k> :m -2<CR>
inoremap <C-j> <Esc>:m +1<CR>gi
inoremap <C-k> <Esc>:m -2<CR>gi
vnoremap <C-k> :m '<-2<CR>gvgv
vnoremap <C-j> :m '>+1<CR>gvgv

nmap <C-s> :w<CR>
nmap <C-q> :q<CR>

let mapleader = "\<Space>"
nnoremap <leader>q :Bdelete<CR>
nnoremap <leader>nu :set nu!<CR>
nnoremap <leader>vi :edit ~/.config/nvim/init.vim<CR>
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>at :ALEToggle<CR>

nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

nnoremap <leader>r :%s///g<Left><Left>
nnoremap <leader>rc :%s///gc<Left><Left><Left>

xnoremap <leader>r :s///g<Left><Left>
xnoremap <leader>rc :s///gc<Left><Left><Left>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gs :Git<CR>

nnoremap <leader>tag :TagbarToggle<CR>

nnoremap <leader>t :bnext<CR>
nnoremap <leader>T :bprev<CR>

nnoremap <leader>doc :ALEHover<CR>
nnoremap <leader>gk :ALEGoToDefinition<CR>

nnoremap gb :call FZFOpen(':Buffers')<CR>

nnoremap gmb :Dispatch mint build<CR>

" created this for lack of a simple, lightweight lsp installer plugin
" supports gopls, pyright installation right now
function! LspInstall(language)
    let out = system('~/.vim/installer/lsp-installers.sh ' . a:language)
    echom out
endfunction
command! -nargs=* LspInstall call LspInstall(<q-args>)

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF
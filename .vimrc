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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
set rtp+=~/.fzf
Plugin 'junegunn/fzf.vim'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'vim-airline/vim-airline'
Plugin 'nanotech/jellybeans.vim'
Plugin 'morhetz/gruvbox'

Plugin 'tpope/vim-dispatch'
Plugin 'dense-analysis/ale'
" Plugin 'vim-syntastic/syntastic'
Plugin 'ajh17/VimCompletesMe'
Plugin 'preservim/tagbar'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'unblevable/quick-scope'
Plugin 'moll/vim-bbye'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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
let g:nerdtree_tabs_open_on_console_startup=2

" NERDTree setting defaults to work around
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
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2

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
" let g:ale_set_loclist = 1
let g:airline#extensions#ale#enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:ale_echo_msg_format = '[%linter%] %code: %%s'
" ['golangci-lint', 'gofmt', 'govet'],
let g:ale_linters = {
\   'go': ['gopls'],
\   'c': ['clang'],
\   'java': ['eclipselsp'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'go': ['gofmt'],
\}

let g:ale_c_cc_options = '-D__KERNEL__ -Wall -Wno-gnu-variable-sized-type-not-at-end -Wno-address-of-packed-member -Wno-tautological-compare -Wno-unknown-warning-option -include /usr/src/kernels/3.10.0-957.21.3.el7.x86_64/include/linux/kconfig.h -I /usr/src/kernels/3.10.0-957.21.3.el7.x86_64/arch/x86/include -I /usr/src/kernels/3.10.0-957.21.3.el7.x86_64/arch/x86/include/uapi -I /usr/src/kernels/3.10.0-957.21.3.el7.x86_64/arch/x86/include/generated -I /usr/src/kernels/3.10.0-957.21.3.el7.x86_64/arch/x86/include/generated/uapi -I /usr/src/kernels/3.10.0-957.21.3.el7.x86_64/include -I /usr/src/kernels/3.10.0-957.21.3.el7.x86_64/include/uapi -I /usr/src/kernels/3.10.0-957.21.3.el7.x86_64/include/generated -I /usr/src/kernels/3.10.0-957.21.3.el7.x86_64/include/generated/uapi -I /usr/src/kernels/3.10.0-957.21.3.el7.x86_64/tools/testing/selftests/bpf'
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" " let g:syntastic_java_javac_exec = '/export/apps/jdk/JDK-1_8_0_121/bin/javac'
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'
"
" function Py2()
"   let g:syntastic_python_python_exec = 'python'
" endfunction
"
" function Py3()
"     let g:syntastic_python_python_exec = 'python3'
" endfunction
"
" call Py3()
"
" function! FindConfig(prefix, what, where)
"     let cfg = findfile(a:what, escape(a:where, ' ') . ';')
"     return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
" endfunction
"
" autocmd FileType python let b:syntastic_python_flake8_args =
"     \ get(g:, 'syntastic_python_flake8_args', '') .
"     \ FindConfig('--config', 'setup.cfg', expand('<afile>:p:h', 1))
"
" let g:godef_split = 0
" let g:go_fmt_fail_silently = 1
" let g:go_list_type = 'quickfix'
" let g:syntastic_go_checkers = ['golint', 'govet', 'gometalinter', 'gofmt']
" let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
" au BufWritePost *.go !gofmt -w %

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

" move multiple lines up/down
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
nnoremap <leader>vi :tabedit ~/.vimrc<CR>
nnoremap <leader>so :source ~/.vimrc<CR>
nnoremap <leader>at :ALEToggle<CR>

nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

nnoremap <leader>r :%s///g<Left><Left>
nnoremap <leader>rc :%s///gc<Left><Left><Left>

xnoremap <leader>r :s///g<Left><Left>
xnoremap <leader>rc :s///gc<Left><Left><Left>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Gcommit<CR>

nnoremap <leader>tag :TagbarToggle<CR>

nnoremap <leader>t :bnext<CR>
nnoremap <leader>T :bprev<CR>

nnoremap <leader>doc :ALEHover<CR>
nnoremap <C-S-d> :ALEGoToDefinition<CR>

nnoremap gb :call FZFOpen(':Buffers')<CR>

nnoremap gmb :Dispatch mint build<CR>

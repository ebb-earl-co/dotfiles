let g:python_host_prog = '/Users/c/.pyenv/shims/python2'
let g:python3_host_prog = '/Users/c/.pyenv/versions/neovim3/bin/python'
" ============================================================================
" Source: https://raw.githubusercontent.com/fisadev/fisa-nvim-config/master/init.vim
" Vim-plug initialization
" Avoid modifying this section, unless you are very sure of what you are doing
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" ============================================================================
" Active plugins

call plug#begin('~/.vim/plugged')
Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
" Surround
Plug 'tpope/vim-surround'
" Automatically sort python imports
Plug 'fisadev/vim-isort'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Lint
" https://web.archive.org/web/20191007175655/http://liuchengxu.org/posts/use-vim-as-a-python-ide/
" https://web.archive.org/web/20191007175757/https://yufanlu.net/2018/09/03/neovim-python/
Plug 'dense-analysis/ale'
Plug 'sirver/ultisnips'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
call plug#end()
" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================

" Enable line numbers
set number
"Enable syntax highlighting
syntax on
"Make tabs as wide as four spaces
set ts=4
"when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
"show the matching part of the pair for [] {} and ()
set showmatch
" move between splits without going through C+w, then j etc ...
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Ultisnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<tab>'

" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<c-j>'

" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_open_list = 'on_save'
let g:ale_completion_enabled = 0
let g:ale_completion_max_suggestions = 1000
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8'], 'rust': ['rls', 'rustfmt'], 'bash': ['shellcheck']}
let g:ale_fixers = {
\	'bash': ['shellcheck'],
\   'json': ['jq'],
\   'python': ['yapf'],
\	'rust': ['rustfmt'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_rust_rls_config = {
\   'rust': {
\     'clippy_preference': 'on'
\   }
\}
let g:ale_fix_on_save = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
\ 'rust': ['ale'],
\ })

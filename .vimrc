set nocompatible

"Pathogen
filetype off
execute pathogen#infect()
execute pathogen#helptags()
filetype on

filetype plugin indent on

nmap f <Plug>(easymotion-f)
nmap F <Plug>(easymotion-F)

"Use the Solarized Dark theme
set background=dark
"colorscheme hybrid " solarized
colorscheme solarized
let g:solarized_termtrans=1

"Make Vim more useful
set nocompatible
"Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
"Enhance command-line completion
set wildmenu
"Allow cursor keys in insert mode
set esckeys
"Allow backspace in insert mode
set backspace=indent,eol,start
"Optimize for fast terminal connections
set ttyfast
"Add the g flag to search/replace by default
set gdefault
"Use UTF-8 without BOM
set encoding=utf-8 nobomb
"Change mapleader
let mapleader=","
"Don’t add empty newlines at the end of files
set binary
set noeol
"Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
"treat hql files as sql files
au BufNewFile,BufRead *.hql set filetype=sql

"Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

"Respect modeline in files
set modeline
set modelines=4
"Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
"Enable line numbers
set number
"Enable syntax highlighting
syntax on
"Highlight current line
set cursorline
"Make tabs as wide as four spaces
set ts=4
"Auto indent enabled
set autoindent
"expand tabs into spaces
set expandtab
"when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
"show the matching part of the pair for [] {} and ()
set showmatch
"open new split panes to right and bottom
set splitbelow
set splitright

" move between splits without going through C+w, then j etc ...
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>



" Show “invisible” characters
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
" set list
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

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" mapping to make movements operate on 1 screen line in wrap mode
" function! ScreenMovement(movement)
"     if &wrap
"         return "g" . a:movement
"     else
"         return a:movement
"     endif
" endfunction
" onoremap <silent> <expr> j ScreenMovement("j")
" onoremap <silent> <expr> k ScreenMovement("k")
" onoremap <silent> <expr> 0 ScreenMovement("0")
" onoremap <silent> <expr> ^ ScreenMovement("^")
" onoremap <silent> <expr> $ ScreenMovement("$")
" nnoremap <silent> <expr> j ScreenMovement("j")
" nnoremap <silent> <expr> k ScreenMovement("k")
" nnoremap <silent> <expr> 0 ScreenMovement("0")
" nnoremap <silent> <expr> ^ ScreenMovement("^")
" nnoremap <silent> <expr> $ ScreenMovement("$"
" let g:snips_trigger_key = '<C-CR>'
" :let g:snips_trigger_key_backwards = '<c-tab>'
" :imap <C-J> <Plug>snipMateNextOrTrigger

" Add key binding for snippets
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"

" Add *hql comment string
autocmd FileType sql setlocal commentstring=--\ %s

" Lint
let g:pymode_lint=1
let g:pymode_lint_checker="pep8"
let g:pymode_folding=0
let g:pymode_rope=0

set nofoldenable

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 80 (can mess with pop-up prompts)
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Yellow
    " autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
augroup END

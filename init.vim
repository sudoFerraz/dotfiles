"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc
"
"" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdtree-project-plugin'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'Yggdroot/indentLine'
" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'tomlion/vim-solidity'


" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'tpope/vim-fugitive'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/edge'
Plug 'vim-airline/vim-airline-themes'
" Plug 'tovarishFin/vim-solidity'
Plug 'sharkdp/fd'
Plug 'nvim-treesiter/vim-treesiter'
Plug 'burntSushi/ripgrep'
Plug 'kyazdani42/nvim-web-devicons'


" Initialize plugin system
call plug#end()

if has("syntax")
	syntax on
endif

set background=dark

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

filetype plugin indent on

set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234
:set cursorcolumn
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white

map <C-n> :NERDTreeToggle<CR>

set number relativenumber
set nu rnu

set showmatch

set shell=sh
set noerrorbells
set colorcolumn=80


:nnoremap gJ :s/\s\{1,}/\r/g<CR>
:vnoremap gJ :'<,'>s/\s\{1,}/\r/g<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif


let g:airline_powerline_fonts = 1

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_diagnostic_text_highlight = 1
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_statusline_style = 'mix'

let g:edge_style = 'neon'
let g:edge_current_word = 'underline'
let g:edge_enable_italic = 1
let g:edge_better_performance = 1
let g:edge_transparent_background = 1
let g:edge_statusline_style = 'mix'
let g:edge_diagnostic_text_highlight = 1

 " Important!!
        if has('termguicolors')
          set termguicolors
        endif
"colorscheme gruvbox-material
colorscheme edge
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:gruvbox_guisp_fallback = 'bg'

let g:SuperTabDefaultCompletionType = "<c-n>"

:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let NERDTreeShowHidden=1

if has('persistent_undo')      "check if your vim version supports it
	set undofile                 "turn on the feature
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

:nnoremap <C-t> :Files<CR>

":map <5> :bnext<CR>

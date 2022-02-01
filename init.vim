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
Plug 'alvan/vim-closetag'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'Yggdroot/indentLine'
" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'christianchiarulli/vim-solidity'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
"Plug 'neovim/nvim-lspconfig'
"Plug 'kabouzeid/nvim-lspinstall'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'nvim-lua/completion-nvim'
Plug 'phanviet/vim-monokai-pro'
Plug 'cristianoliveira/vim-react-html-snippets'





" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
Plug 'romgrk/barbar.nvim'
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

"map <C-n> :NERDTreeToggle<CR>

" Open NERDTree in the directory of the current file (or /home if no file is open)
nmap <silent> <C-n> :call NERDTreeToggleInCurDir()<cr>
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (exists("t:NERDTreeBufName"))
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction


set number relativenumber
set nu rnu

set showmatch

set shell=/bin/bash
set noerrorbells
set colorcolumn=80


:nnoremap gJ :s/\s\{1,}/\r/g<CR>
:vnoremap gJ :'<,'>s/\s\{1,}/\r/g<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

set mouse+=a

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

let g:airline_powerline_fonts = 1

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1
"let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_diagnostic_text_highlight = 1
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_statusline_style = 'mix'

let g:sonokai_transparent_background = 1

"let g:edge_style = 'neon'
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
"colorscheme sonokai
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

":nnoremap <C-t> :Files<CR>
:nnoremap <C-t> :Telescope find_files<CR>
:nnoremap <C-f> :Telescope live_grep<CR>
:nnoremap <C-c> "+yy<CR>
:nnoremap <C-r> :ALEFix eslint<CR>
:nnoremap <S-r> :redo<CR>

" leave insert mode quickly
  if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
    augroup END
  endif

let g:ale_python_auto_pipenv = 1
let g:ale_python_pylint_change_directory=0
let g:ale_python_flake8_change_directory=0

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
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

lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF

lua << EOF
EOF

"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
"
"
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }

:set nowrap

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction



":map <5> :bnext<CR>

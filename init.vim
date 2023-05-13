call plug#begin()

Plug 'glepnir/dashboard-nvim'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'jiangmiao/auto-pairs'
Plug 'ms-jpq/coq_nvim', { 'branch': 'coq' }
Plug 'ms-jpq/coq.thirdparty', { 'branch': '3p' }
Plug 'ms-jpq/coq.artifacts', { 'branch': 'artifacts' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

call plug#end()

set noshowmode
set nowrap
set number
set nobackup
set nowritebackup
set cursorline
set showcmd
set noruler
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch
set expandtab
set termguicolors

set t_Co=256
set updatetime=300
set mouse=a
set tabstop=2
set shiftwidth=2
set cursorlineopt=number
set encoding=UTF-8
set fileencoding=UTF-8

filetype plugin on
filetype indent on

autocmd TermOpen * setlocal nonumber

let g:coq_settings = {
      \ 'display.preview.border': [
        \["" , "NormalFloat"],
        \["" , "NormalFloat"],
        \["" , "NormalFloat"],
        \[" ", "NormalFloat"],
        \["" , "NormalFloat"],
        \["" , "NormalFloat"],
        \["" , "NormalFloat"],
        \[" ", "NormalFloat"],
      \],
      \ 'auto_start': 'shut-up',
      \ 'display.icons.mode': 'none',
    \}

let g:version = matchstr(execute('version'), 'NVIM v\zs[^\n]*')
let g:python3_host_prog = '/usr/bin/python3'

let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('finder')
require('tree')
require('dash')
require('statusline')
require('tabline')
require('lsp')
require('tsitter')
EOF

colorscheme catppuccin-macchiato

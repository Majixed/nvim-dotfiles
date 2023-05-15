vim.g.mapleader = ' '

require('lazy-nvim')

vim.cmd[[set noshowmode]]
vim.cmd[[set nowrap]]
vim.cmd[[set number]]
vim.cmd[[set nobackup]]
vim.cmd[[set writebackup]]
vim.cmd[[set cursorline]]
vim.cmd[[set showcmd]]
vim.cmd[[set noruler]]
vim.cmd[[set incsearch]]
vim.cmd[[set ignorecase]]
vim.cmd[[set smartcase]]
vim.cmd[[set showmatch]]
vim.cmd[[set hlsearch]]
vim.cmd[[set expandtab]]

vim.cmd[[set mouse=a]]
vim.cmd[[set tabstop=2]]
vim.cmd[[set shiftwidth=2]]
vim.cmd[[set cursorlineopt=number]]
vim.cmd[[set encoding=UTF-8]]
vim.cmd[[filetype plugin on]]
vim.cmd[[filetype indent on]]
vim.cmd[[autocmd TermOpen * setlocal nonumber]]

vim.g.python3_host_prog = '/usr/bin/python3'

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd[[colorscheme catppuccin-macchiato]]

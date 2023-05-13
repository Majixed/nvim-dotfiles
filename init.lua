-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to vim.o `mapleader` before lazy so your mappings are correct

require("bootstrap")
require('lazy').setup {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = 'nvim-lua/plenary.nvim'
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
    'jiangmiao/auto-pairs',
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'ms-jpq/coq_nvim', branch = 'coq' },
  { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
  { 'ms-jpq/coq.thirdparty', branch = '3p' },
  { 'catppuccin/nvim', name = 'catppuccin' },
}

vim.cmd[[set noshowmode]]
vim.cmd[[set nowrap]]
vim.cmd[[set nowrap]]
vim.cmd[[set number]]
vim.cmd[[set nobackup]]
vim.cmd[[set nowritebackup]]
vim.cmd[[set cursorline]]
vim.cmd[[set showcmd]]
vim.cmd[[set noruler]]
vim.cmd[[set incsearch]]
vim.cmd[[set ignorecase]]
vim.cmd[[set smartcase]]
vim.cmd[[set showmatch]]
vim.cmd[[set hlsearch]]
vim.cmd[[set expandtab]]

vim.cmd[[set updatetime=300]]
vim.cmd[[set mouse=a]]
vim.cmd[[set tabstop=2]]
vim.cmd[[set shiftwidth=2]]
vim.cmd[[set cursorlineopt=number]]
vim.cmd[[set encoding=UTF-8]]
vim.cmd[[set fileencoding=UTF-8]]
vim.cmd[[filetype plugin on]]
vim.cmd[[filetype indent on]]
vim.cmd[[autocmd TermOpen * setlocal nonumber]]

vim.g.python3_host_prog = '/usr/bin/python3'

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('finder')
require('tree')
require('dash')
require('statusline')
require('tabline')
require('lsp')
require('tsitter')

vim.cmd[[colorscheme catppuccin-macchiato]]

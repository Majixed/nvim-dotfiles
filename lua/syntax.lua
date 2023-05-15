local treesitter = require('nvim-treesitter.configs')

local config = {
  ensure_installed = {
    'vim',
    'vimdoc',
    'lua',
    'luadoc',
    'bash',
    'diff',
    'gitignore',
    'gitcommit',
    'python',
    'latex',
    'markdown',
    'rst',
    'json',
  },
  auto_install = true,
  highlight = {
    enable = true,
  },
}

treesitter.setup(config)

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
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
        'markdown_inline',
        'json',
      },
      highlight = {
        enable = true,
      },
    }
  end
}

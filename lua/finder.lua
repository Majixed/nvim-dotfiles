local telescope = require('telescope')

local config = {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
    }
  }
}

telescope.setup(config)
telescope.load_extension('fzf')

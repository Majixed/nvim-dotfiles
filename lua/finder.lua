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

local palette = require('catppuccin.palettes').get_palette 'macchiato'

local colors = {
  bg       = palette.mantle,
  fg       = palette.text,
  pink     = palette.flamingo,
  gray     = palette.surface0,
  magenta  = palette.pink,
  green    = palette.green,
  red      = palette.red,
}

local TelescopeColor = {
	TelescopeMatching = { fg = colors.pink },
	TelescopeSelection = { fg = colors.fg, bg = colors.gray, bold = true },

	TelescopePromptPrefix = { bg = colors.gray },
	TelescopePromptNormal = { bg = colors.gray },
	TelescopeResultsNormal = { bg = colors.bg },
	TelescopePreviewNormal = { bg = colors.bg },
	TelescopePromptBorder = { bg = colors.gray, fg = colors.gray },
	TelescopeResultsBorder = { bg = colors.bg, fg = colors.bg },
	TelescopePreviewBorder = { bg = colors.bg, fg = colors.bg },
	TelescopePromptTitle = { bg = colors.gray, fg = colors.magenta, bold = true },
	TelescopeResultsTitle = { fg = colors.bg },
	TelescopePreviewTitle = { bg = colors.bg, fg = colors.green, bold = true },
}

for hl, col in pairs(TelescopeColor) do
	vim.api.nvim_set_hl(0, hl, col)
end

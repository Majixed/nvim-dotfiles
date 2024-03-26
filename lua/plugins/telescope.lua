return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = {
    {
      'nvim-lua/plenary.nvim'
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    {
      'catppuccin/nvim',
      name = 'catppuccin'
    }
  },
  config = function()
    require('telescope').setup {
      defaults = {
        prompt_prefix = '   ',
        selection_caret = '  ',
        sorting_strategy = 'ascending',
        layout_config = {
          prompt_position = 'top',
        },
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
          fuzzy = false,
        }
      }
    }
    require('telescope').load_extension('fzf')

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
  end
}

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  config = function()
    require('catppuccin').setup {
      flavour = 'macchiato',
      integrations = {
        barbar = true
      }
    }
    vim.cmd.colorscheme 'catppuccin'
  end
}

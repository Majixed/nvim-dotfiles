return {
  'catppuccin/nvim',
  name = 'catppuccin',
  config = function()
    require('catppuccin').setup {
      flavour = 'macchiato',
      integrations = {
        notify = true,
      },
    }

    vim.cmd.colorscheme 'catppuccin'
  end
}

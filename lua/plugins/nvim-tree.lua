return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-web-devicons',
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('nvim-tree').setup {
      hijack_cursor = true,
      disable_netrw = true,
      hijack_netrw = true,
      renderer = {
        indent_markers = {
          enable = true
        },
        icons = {
          show = {
            folder_arrow = false
          }
        }
      }
    }
  end
}

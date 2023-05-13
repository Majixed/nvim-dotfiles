local barbar = require('barbar')

local config = {
  no_name_title = '[No Name]',
  hide = { extensions = true },
  icons = {
    buffer_index = false,
    buffer_number = false,
    button = '󰅖',
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = true, icon = ' ' },
      [vim.diagnostic.severity.WARN] = { enabled = false },
      [vim.diagnostic.severity.INFO] = { enabled = false },
      [vim.diagnostic.severity.HINT] = { enabled = false },
    },
    filetype = {
      custom_colors = false,

      enabled = true,
    },
    separator = { left = '', right = '' },

    modified = { button = '●' },
    pinned = { buffer_index = true, filename = true, button = '󰅖', separator = { left = '', right = '' } },

    alternate = { filetype = { enabled = false } },
    current = { buffer_index = false },
    inactive = { button = '󰅖', separator = { left = '', right = '' } },
    visible = { modified = { buffer_number = false } },
  },
  exclude_ft = { 'netrw' },
  highlight_visible = false,
}

barbar.setup(config)

vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function(tbl)
    if vim.bo[tbl.buf].filetype == 'NvimTree' then
      require'bufferline.api'.set_offset(30)
    end
  end
})

vim.api.nvim_create_autocmd({ 'BufWinLeave', 'BufWipeout' }, {
  callback = function(tbl)
    if vim.bo[tbl.buf].filetype == 'NvimTree' then
      require'bufferline.api'.set_offset(0)
    end
  end
})

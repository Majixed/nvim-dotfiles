return {
  'romgrk/barbar.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('barbar').setup {
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

    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
    map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
    map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
    map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
    map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
    map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
    map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
    map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
    map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
    map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
    map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
    map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
    map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
    map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
    map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
    map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
    map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
  end
}

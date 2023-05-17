vim.api.nvim_create_autocmd('TermOpen', {
  command = 'setlocal nonumber | startinsert',
})

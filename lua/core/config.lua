vim.g.mapleader = ' '

vim.g.python3_host_prog = vim.fn.exepath('python')

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.o.showmode = false
vim.o.wrap = false
vim.o.number = true
vim.o.backup = false
vim.o.cursorline = true
vim.o.showcmd = true
vim.o.ruler = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmatch = true
vim.o.expandtab = true

vim.o.cursorlineopt = 'number'
vim.o.mouse = 'a'

vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.scrolloff = 5

if vim.fn.executable('pwsh') == 1 then
  vim.o.shell = 'pwsh'
else
  vim.o.shell = 'powershell'
end
vim.o.shellcmdflag = '-command'
vim.o.shellquote = '\"'
vim.o.shellxquote = ''

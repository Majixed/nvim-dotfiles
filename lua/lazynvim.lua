local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = 'nvim-lua/plenary.nvim'
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  { 'nvim-lua/plenary.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'ms-jpq/coq_nvim', branch = 'coq' },
  { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
  { 'ms-jpq/coq.thirdparty', branch = '3p' },
  { 'catppuccin/nvim', name = 'catppuccin' },
}

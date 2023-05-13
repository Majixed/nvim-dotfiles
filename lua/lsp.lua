local lspconfig = require('lspconfig')
local coq = require('coq')

local lua_ls_config = {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.pyright.setup(coq.lsp_ensure_capabilities())
lspconfig.vimls.setup(coq.lsp_ensure_capabilities())
lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities(lua_ls_config))

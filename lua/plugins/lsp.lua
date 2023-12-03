return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'rafamadriz/friendly-snippets',
    'folke/neodev.nvim',
    'onsails/lspkind.nvim',
    'windwp/nvim-autopairs',
  },
  config = function()
    local lspconfig = require('lspconfig')
    local lspkind = require('lspkind')
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
    end

    require('neodev').setup {}
    require('mason').setup {}
    require('mason-lspconfig').setup {
      ensure_installed = {
        'texlab',
        'pyright',
        'vimls',
        'lua_ls',
      }
    }

    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )

    cmp.setup {
      snippet = {
        expand = function(args)
          vim.fn['vsnip#anonymous'](args.body)
        end,
      },
      formatting = {
        format = lspkind.cmp_format {
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
          menu = {
            buffer = '[BUF]',
            nvim_lsp = '[LSP]',
            vsnip = '[SNIP]',
            path = '[PATH]',
          },
        },
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<Down>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.close()
            fallback()
          else
            fallback()
          end
        end, { 'i' }),

        ['<Up>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.close()
            fallback()
          else
            fallback()
          end
        end, { 'i' })
      },
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'path' },
      }
    }

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local lua_ls_config = {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          completion = {
            callSnippet = 'Replace',
          },
          workspace = {
            checkThirdParty = false,
          },
        },
      },
      capabilities = capabilities
    }

    lspconfig.pyright.setup { capabilities = capabilities }
    lspconfig.vimls.setup { capabilities = capabilities }
    lspconfig.texlab.setup { capabilities = capabilities }
    lspconfig.lua_ls.setup(lua_ls_config)
  end
}

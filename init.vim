call plug#begin()

Plug 'glepnir/dashboard-nvim'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

call plug#end()

set noshowmode
set nowrap
set number
set nobackup
set nowritebackup
set cursorline
set showcmd
set noruler
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch
set expandtab
set termguicolors

set t_Co=256
set updatetime=300
set mouse=a
set tabstop=2
set shiftwidth=2
set cursorlineopt=number
set encoding=UTF-8
set fileencoding=UTF-8

filetype plugin on
filetype indent on

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? '\<Tab>' :
      \ coc#refresh()

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: '\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>'

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:version = matchstr(execute('version'), 'NVIM v\zs[^\n]*')

lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('dashboard').setup {
  theme = 'doom',
  config = {
    header = {
      [[                                                                                ]],
      [[                                                                                ]],
      [[                                                                                ]],
      [[                                                                                ]],
      [[                                                                                ]],
	    [[                                                                                ]],
      [[ =================     ===============     ===============   ========  ======== ]],
      [[ \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . // ]],
      [[ ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .|| ]],
      [[ || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . || ]],
      [[ ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .|| ]],
      [[ || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . || ]],
      [[ ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .|| ]],
      [[ || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . || ]],
      [[ ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.|| ]],
      [[ ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `|| ]],
      [[ ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   || ]],
      [[ ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   || ]],
      [[ ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   || ]],
      [[ ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   || ]],
      [[ ||   .=='    _-'          `-__\._-'         `-_./__-'         `' |. /|  |   || ]],
      [[ ||.=='    _-'                                                     `' |  /==.|| ]],
      [[ =='    _-'                                                            \/   `== ]],
      [[ \   _-'                           N E O V I M                          `-_   / ]],
      [[  `''                                                                      ``'  ]],
      [[                                                                                ]],
    },
    center = {
      {
        icon = '  ',
        desc = 'File search',
        action = 'Telescope find_files hidden=true',
      },
      {
        icon = '󰱼  ',
        desc = 'Word search',
        action = 'Telescope live_grep',
      },
      {
        icon = '󰈢  ',
        desc = 'Recent files',
        action = 'Telescope oldfiles',
      },
      {
        icon = '󰝒  ',
        desc = 'New file',
        action = 'enew',
      },
      {
        icon = '  ',
        desc = 'Quit',
        action = 'q',
      },
    },
    footer = {
      [[]],
      [[v]] .. vim.g.version,
    }
  },
}

require('nvim-tree').setup()

local function open_nvim_tree(data)

  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end
  
  vim.cmd.cd(data.file)
      
  require('nvim-tree.api').tree.open()

end

vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    disabled_filetypes = { 'NvimTree' },
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

require('barbar').setup {
  no_name_title = '[No Name]'
}

vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function(tbl)
    if vim.bo[tbl.buf].filetype == 'NvimTree' then
      require'bufferline.api'.set_offset(30, 'File Tree')
    end
  end
})

vim.api.nvim_create_autocmd({'BufWinLeave', 'BufWipeout'}, {
  callback = function(tbl)
    if vim.bo[tbl.buf].filetype == 'NvimTree' then
      require'bufferline.api'.set_offset(0)
    end
  end
})

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
}
EOF

colorscheme catppuccin-macchiato

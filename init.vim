call plug#begin()

	Plug 'neovim/nvim-lspconfig'

	"Theme
	Plug 'tanvirtin/monokai.nvim'

	"lualine
	Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'

	"test"
  "telescope
  Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'

	"nvim-cmp
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/nvim-cmp'

	"vim-vsnip
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'

	"lspsaga
	Plug 'neovim/nvim-lspconfig'
	Plug 'glepnir/lspsaga.nvim'

	"autopairs
	Plug 'windwp/nvim-autopairs'

	"vim-surround
	Plug 'blackcauldron7/surround.nvim'



call plug#end()

lua require('plugins.nvim-lspconfig')
lua require('plugins.neovim-monokai')
lua require('plugins.lualine')
lua require('plugins.nvim-cmp')
lua require('plugins.lspsaga')
lua require('plugins.nvim-autopairs')
lua require('plugins.surround-nvim')

set number

" Spaces & Tabs {{{
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set autoindent
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs

"set list
"set listchars+=trail:•

nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent> gh :Lspsaga lsp_finder<CR>


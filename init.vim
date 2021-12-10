call plug#begin()

	Plug 'neovim/nvim-lspconfig'

	"Theme
	"Plug 'tanvirtin/monokai.nvim'
	"Plug 'lifepillar/vim-gruvbox8'
	"Plug 'catpuccin/nvim'
	Plug 'morhetz/gruvbox'

	"lualine
	Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'

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
	Plug 'tpope/vim-surround'

	"vim-commentary
	Plug 'tpope/vim-commentary'

	"vim-treesitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

colorscheme gruvbox

lua require('plugins.nvim-lspconfig')
lua require('plugins.lualine')
lua require('plugins.nvim-cmp')
lua require('plugins.lspsaga')
lua require('plugins.nvim-autopairs')
lua require('plugins.telescope')
lua require('plugins.treesitter')

set relativenumber
set list
set scrolloff=10
set termguicolors

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
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

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

	"autopairs
	Plug 'windwp/nvim-autopairs'

	"vim-surround
	Plug 'tpope/vim-surround'

	"vim-commentary
	Plug 'tpope/vim-commentary'

	"vim-treesitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	"prettier
	Plug 'jose-elias-alvarez/null-ls.nvim'
	Plug 'MunifTanjim/prettier.nvim'

call plug#end()

lua << EOF

local null_ls = require("null-ls")
local prettier = require("prettier")

null_ls.setup({
   on_attach = function(client, bufnr)
     if client.resolved_capabilities.document_formatting then
       vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting_seq_sync()<CR>")
       -- format on save
       vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_seq_sync()")
     end

     if client.resolved_capabilities.document_range_formatting then
       vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
     end
   end,
})

prettier.setup({
  bin = 'prettierd', -- or `prettierd`
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

EOF

colorscheme gruvbox

lua require('plugins.nvim-lspconfig')
lua require('plugins.lualine')
lua require('plugins.nvim-cmp')
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

autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()

call plug#begin("~/.vim/plugged")
  " Plugin Section 
  Plug 'tpope/vim-surround'
  Plug 'windwp/nvim-autopairs'
  Plug 'vimwiki/vimwiki'

  " Best colorscheme = nordfox
  Plug 'EdenEast/nightfox.nvim' 

  Plug 'pedro757/emmet'
  Plug 'scrooloose/syntastic'
  Plug 'mattn/emmet-vim'
  Plug 'fatih/vim-go'
  Plug 'folke/tokyonight.nvim'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' } 
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
  Plug 'neovim/nvim-lspconfig' 
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'jparise/vim-graphql'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

  Plug 'simrat39/rust-tools.nvim'
  Plug 'mfussenegger/nvim-dap'
  Plug 'rcarriga/nvim-dap-ui'
  Plug 'leoluz/nvim-dap-go'
  Plug 'tpope/vim-fugitive'
  Plug 'mfussenegger/nvim-dap'
  Plug 'rcarriga/nvim-dap-ui'
  Plug 'leoluz/nvim-dap-go'
  Plug 'voldikss/vim-floaterm'

  Plug 'hrsh7th/cmp-path'
  Plug 'voldikss/vim-floaterm'
  Plug 'L3MON4D3/LuaSnip'

  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-cmdline'

  Plug 'saadparwaiz1/cmp_luasnip'

  Plug 'nvim-lua/plenary.nvim'
  Plug 'ThePrimeagen/harpoon'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

call plug#end()

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
set number

let mapleader = " "


let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

nnoremap <leader>tn :tabnew<CR>

set completeopt=menu,menuone,noselect


set updatetime=50
set noswapfile
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set relativenumber 
set smartindent
set autoindent
set mouse=a
set nowrap
set nohlsearch
set incsearch

filetype plugin indent on

" Go syntax highlighting
let g:go_highlight_fields = 1 
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1 
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>B :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>R  <Plug>(go-run) 
autocmd FileType go nmap <leader>T  <Plug>(go-test)

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
imap jj <ESC>

nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

nnoremap <C-t> :FloatermToggle<CR>


" change dir on " cd"
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Leader s for instant sex
nnoremap <leader>s :Sex<CR>
nnoremap <leader>x :Ex<CR>

let g:netrw_banner = 0

lua require('bildls/lsp')
lua require('bildls/color')
lua require('bildls/telescope')
lua require('bildls/dap')

" Enable syntax highlighting 
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  }
}

require("nvim-autopairs").setup {}
EOF

augroup go_autocmd
  autocmd BufWritePre *.go GoFmt
augroup END

autocmd FileType rust nnoremap <leader>r <cmd>!cargo run<cr>

nnoremap <leader>m :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>h :lua require("harpoon.ui").toggle_quick_menu()<CR>

lua require("telescope").load_extension('harpoon')

autocmd FileType rust nnoremap <leader>r  <cmd>:w<cr><cmd>!cargo run<cr>


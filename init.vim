" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" leader
" let mapleader = ';'
" let g:mapleader = ';'

lua require('basic')
lua require('keybindings')
lua require('plugins')
lua require('plugin-config/nvim-tree')
lua require('plugin-config/nvim-treesitter')
lua require('plugin-config/bufferline')
lua require('lsp/setup')
lua require('lsp/nvim-cmp')


set background=dark
colorscheme gruvbox

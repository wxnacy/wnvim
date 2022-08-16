" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
source ~/.vim/vimrcs/mapping.vim

"lua require('basic')
lua require('keybindings')
lua require('plugins')
lua require('plugin-config')
lua require('lsp')

set background=dark
" colorscheme nord
" colorscheme gruvbox
colorscheme zephyr

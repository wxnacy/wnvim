" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
lua vim.g.wnvim_plugin_home = vim.fn.stdpath("data") .. "/site/pack/packer/start"

" source ~/.vim/vimrcs/basic.vim
" source ~/.vim/vimrcs/mapping.vim
if filereadable(g:wnvim_plugin_home . "/wvim/README.md")
    " 加载 wvim 共用数据
    " let basic_path=g:wnvim_plugin_home . "/wvim/vimrcs/basic.vim"
    " echo a:basic_path
    " source &basic_path
    " source g:wnvim_plugin_home . "/wvim/vimrcs/mapping.vim"
    " vim.api.nvim_command('new')
    " lua luaload vim.g.wnvim_plugin_home .. "/wvim/vimrcs/basic.vim"
    source ~/.local/share/nvim/site/pack/packer/start/wvim/vimrcs/basic.vim
    source ~/.local/share/nvim/site/pack/packer/start/wvim/vimrcs/mapping.vim
endif


"lua require('basic')
lua require('keybindings')
lua require('plugins')
lua require('plugin-config')
lua require('lsp')

set number
set background=dark
" colorscheme nord
" colorscheme gruvbox
colorscheme zephyr

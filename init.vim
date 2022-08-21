" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
lua vim.g.wnvim_plugin_home = vim.fn.stdpath("data") .. "/site/pack/packer/start"

" source ~/.vim/vimrcs/basic.vim
" source ~/.vim/vimrcs/mapping.vim
if filereadable(g:wnvim_plugin_home . "/wvim/README.md")
    " 加载 wvim 共用数据
    lua vim.api.nvim_command("source" .. vim.g.wnvim_plugin_home .. "/wvim/vimrcs/basic.vim")
    lua vim.api.nvim_command("source" .. vim.g.wnvim_plugin_home .. "/wvim/vimrcs/mapping.vim")
endif


"lua require('basic')
lua require('keybindings')
lua require('plugins').setup()
lua require('plugin-config')
lua require('autocmds')
lua require('lsp')

set number
" set background=dark
" colorscheme nord
" colorscheme gruvbox
" colorscheme zephyr
colorscheme tokyonight

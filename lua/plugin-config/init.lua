require('plugin-config/nvim-notify')
require('plugin-config/nvim-tree')
require('plugin-config/nvim-treesitter')
require('plugin-config/bufferline')
require('plugin-config/fzf')
require('plugin-config/vim-easymotion')
require('plugin-config/LeaderF')
require('plugin-config/indent-blankline')
require('plugin-config/sniprun')
require('plugin-config/todo-comments')
require('plugin-config/telescope')
require('plugin-config/vim-fugitive')
require('plugin-config/gitsigns')
require('plugin-config/vim-illuminate')

-- for nerdcommenter 快速注释
vim.g.NERDSpaceDelims = 1

-- vim-trailing-whitespace
vim.keymap.set('n', '<leader><space>', ':FixWhitespace<cr>')


local utils = require("utils")

require('plugins.config/bufferline')
require('plugins.config/fzf')
require('plugins.config/vim-fugitive')
require('plugins.config/hop')
require('plugins.config/vista')
require('plugins.config/mason')
require('plugins.config/null-ls')

local ok, toggleterm = utils.require('toggleterm')
if ok then
    -- https://github.com/akinsho/toggleterm.nvim
    toggleterm.setup()
end

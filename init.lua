require('keybindings')
require('plugins').setup()
require('autocmds')
require('lsp')

-- 加载本地插件 path
local local_plugin_home = require("config").CONFIG_HOME
if require('utils').is_dir_exists(local_plugin_home) then
    package.path = local_plugin_home .. "/?.lua;" .. package.path
    package.path = local_plugin_home .. "/?/init.lua;" .. package.path
end

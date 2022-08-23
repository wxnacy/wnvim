require('keybindings')
require('plugins').setup()
require('autocmds')
require('lsp')

local utils = require("utils")
local config = require("config")
if not utils.is_dir_exists(config.CONFIG_HOME) then
    os.execute("mkdir -p " .. config.CONFIG_HOME)
end

-- 加载本地插件 path
local local_plugin_home = config.CONFIG_HOME
if require('utils').is_dir_exists(local_plugin_home) then
    package.path = local_plugin_home .. "/?.lua;" .. package.path
    package.path = local_plugin_home .. "/?/init.lua;" .. package.path
end

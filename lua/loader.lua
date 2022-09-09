local M = {}
local utils = require("utils")
local config = require("config")

local function load_config()
    require('keybindings')
    if not utils.is_dir_exists(config.CONFIG_HOME) then
        os.execute("mkdir -p " .. config.CONFIG_HOME)
    end
end

local function load_plugin()
    -- 加载插件
    require('plugins').setup()
    -- require('plugins.packer')
    require('lsp')
    require('autocmds')

    -- 加载本地插件
    local local_plugin_home = config.CONFIG_HOME
    if utils.is_dir_exists(local_plugin_home) then
        package.path = local_plugin_home .. "/?.lua;" .. package.path
        package.path = local_plugin_home .. "/?/init.lua;" .. package.path
    end
end

-- 加载项目配置
-- 在最后加载
local function load_project_config()
    local plugin_configs = { "~/.nvimrc", ".nvimrc" }
    for _, path in ipairs(plugin_configs) do
        if utils.is_dir_exists(path) then
            vim.api.nvim_command("source " .. path)
        end
    end
end

M.setup = function ()
    load_config()
    load_plugin()
    load_project_config()
end

return M

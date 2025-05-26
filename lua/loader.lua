local M = {}
local utils = require("utils")
local config = require("config")

local function load_config()
    require('basic')
    require('keybindings')
    if not utils.is_dir_exists(config.CONFIG_HOME) then
        os.execute("mkdir -p " .. config.CONFIG_HOME)
    end
end

local function load_plugin()
    -- 加载插件
    -- require('plugins').setup()
    require('plugins.packer')
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
    require("autocmds")
    -- load_plugin()
    require("config.lazy").setup()
    load_project_config()
    -- 放在最后，避免被插件的配置覆盖
    require('basic')
end

return M

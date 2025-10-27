local M = {}
local utils = require("utils")
local config = require("config")
local config_loader = require("config_loader")

local function load_config()
    require('basic')
    require('keybindings')
    if not utils.is_dir_exists(config.CONFIG_HOME) then
        os.execute("mkdir -p " .. config.CONFIG_HOME)
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
    config_loader.load()
    load_config()
    require("autocmds")
    -- load_plugin()
    require("plugins")
    load_project_config()
    -- 放在最后，避免被插件的配置覆盖
    require('basic')
end

return M

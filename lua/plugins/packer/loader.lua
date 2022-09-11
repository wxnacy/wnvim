local M = {}

-- 加载 config 方法
M.load_config = function (plugin)
    if type(plugin) ~= 'table' then
        return
    end

    local first_sepc = plugin[1]
    if type(first_sepc) == 'table' then
        for _, sub_plugin in ipairs(plugin) do
            M.load_config(sub_plugin)
        end
    else
        local name, _ = require("packer.util").get_plugin_short_name(plugin)
        -- print(name)
        -- print(_G.packer_plugins[name])
        -- print(_G.packer_plugins[name].loaded)
        if plugin.config and require("plugins.packer.utils").is_install_plugin(name) then
            pcall(plugin.config)
        end
    end
end

M.setup = function (configs)
    local is_new_install = require("plugins.packer.utils").install_packer()
    local status_ok, packer = require("utils").require("packer", true)
    if not status_ok then
        return
    end
    vim.cmd [[packadd packer.nvim]]

    local startup = function (use)
        for _, plugin in ipairs(configs) do
            use(plugin)
            M.load_config(plugin)
        end
    end
    packer.reset()
    packer.startup(startup)

    -- 新装插件时安装全部
    if is_new_install then
        packer.sync()
    end
    require("plugins.config")
end

return M

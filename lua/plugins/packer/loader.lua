local M = {}

M.setup = function (configs)
    local is_new_install = require("plugins.packer.utils").install_packer()
    local status_ok, packer = require("utils").require("packer", true)
    if not status_ok then
        return
    end
    -- vim.cmd [[packadd packer.nvim]]

    local startup = function (use)
        for _, plugin in ipairs(configs) do
            use(plugin)

            -- 手动加载 config 方法
            if type(plugin) == 'table' then
                if plugin.config then
                    pcall(plugin.config)
                end
                -- for _, _plugin in ipairs(plugin) do
                    -- use(_plugin)
                -- end
            -- else
                -- use(plugin)
            end
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

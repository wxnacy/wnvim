local M = {}

M.setup = function (configs)
    local is_new_install = require("plugins.packer.utils").install_packer()
    local status_ok, packer = require("utils").require("packer", true)
    if not status_ok then
        return
    end
    packer.reset()
    packer.startup(configs)

    -- 新装插件时安装全部
    if is_new_install then
        packer.sync()
    end
end

return M

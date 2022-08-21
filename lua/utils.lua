local M = {}
local fn = vim.fn

-- 是否安装插件
M.is_install_plugin = function (name)

    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/" .. name
    if fn.empty(fn.glob(install_path)) > 0 then
        return false
    else
        return true
    end
    -- 使用模块判断
    -- local status, _ = pcall(require, name)
    -- if not status then
        -- return false
    -- else
        -- return true
    -- end
end

return M

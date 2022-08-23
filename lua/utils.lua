local M = {}
local fn = vim.fn

-- 是否安装插件
M.is_install_plugin = function (name)

    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/" .. name
    return M.is_dir_exists(install_path)
end

-- 目录是否存在
M.is_dir_exists = function (dirname)
    if fn.empty(fn.glob(dirname)) > 0 then
        return false
    else
        return true
    end
end

-- 是否可以导入模块
M.can_require = function (module)
    local status, _ = pcall(require, module)
    if not status then
        return false
    else
        return true
    end
end

-- 动态导入
M.require = function (module)
    return pcall(require, module)
end

-- 运行命令
M.run_cmd = function (cmd)
    return pcall(vim.cmd, cmd)
end

-- 是否成功运行命令
M.can_success_run_cmd = function (cmd)
    local ok, _ = pcall(vim.cmd, cmd)
    if not ok then
        return false
    else
        return true
    end
end

return M

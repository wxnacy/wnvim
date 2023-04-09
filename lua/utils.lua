local M = {}
local fn = vim.fn
local config = require("config")

-- 是否安装插件
M.is_install_plugin = function(name)
    return M.is_dir_exists(M.plugin_dir(name))
end

M.join_path = function(...)
    return table.concat({ ... }, "/")
end

M.plugin_dir = function (name)
    return M.join_path(config.PLUGIN_HOME, name)
end

-- 目录是否存在
M.is_dir_exists = function(dirname)
    if fn.empty(fn.glob(dirname)) > 0 then
        return false
    else
        return true
    end
end

-- 是否可以导入模块
M.can_require = function(module)
    local status, _ = pcall(require, module)
    if not status then
        return false
    else
        return true
    end
end

-- 动态导入
M.require = function(module, is_warn_notify)
    local ok, mod = pcall(require, module)
    if not ok and is_warn_notify then
        M.notify_not_installed(module)
    end
    return ok, mod
end

-- 动态执行 setup 方法
M.setup = function(module, configs, is_warn_notify)
    local ok, mod = pcall(require, module)
    if not ok and is_warn_notify then
        M.notify_not_installed(module)
        return {}
    end
    return mod.setup(configs)
end

-- 运行命令
M.run_cmd = function(cmd)
    return pcall(vim.cmd, cmd)
end

-- 是否成功运行命令
M.can_success_run_cmd = function(cmd)
    local ok, _ = pcall(vim.cmd, cmd)
    if not ok then
        return false
    else
        return true
    end
end

M.notify_warn = function(msg)
    vim.notify(msg, vim.log.levels.WARN, {
        title = "wnvim"
    })
end

-- 提示没有安装信息
M.notify_not_installed = function(name)
    local msg = name .. " is not installed"
    vim.notify(msg, vim.log.levels.WARN, {
        title = "wnvim"
    })
end

-- 公共 key options
M.set_keymap = function(mode, lhs, rhs, opts)
    opts = opts or { noremap = true, silent = true }
    vim.keymap.set(mode, lhs, rhs, opts)
end

M.print_pairs = function(_table)
    local count = 0
    for name, plugin in pairs(_table) do
        print(name, plugin)
        count = count + 1
    end
    print(count)
end

M.print_ipairs = function(_table)
    local count = 0
    for name, plugin in ipairs(_table) do
        print(name, plugin)
        count = count + 1
    end
    print(count)
end

return M

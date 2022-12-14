local packer_util = require("packer.util")
local M = {}

-- 遍历文件夹
M.listdir = function(dirname)
    local items = {}
    local opt_dir_handle = vim.loop.fs_opendir(dirname, nil, 50)
    if opt_dir_handle then
        local opt_dir_items = vim.loop.fs_readdir(opt_dir_handle)
        while opt_dir_items do
            for _, item in ipairs(opt_dir_items) do
                table.insert(items, item)
            end
            opt_dir_items = vim.loop.fs_readdir(opt_dir_handle)
        end
    end
    return items
end

-- 获取下载目录
M.get_install_path = function(name)
    return packer_util.join_paths(vim.fn.stdpath("data"), "site", "pack", "packer", name)
end

-- 是否下载
M.is_installed = function(name)
    local start_path = packer_util.join_paths(M.get_install_path('start'), name)
    if vim.fn.empty(vim.fn.glob(start_path)) > 0 then
        local opt_path = packer_util.join_paths(M.get_install_path('opt'), name)
        if vim.fn.empty(vim.fn.glob(start_path)) > 0 then
            return false, nil
        else
            return true, opt_path
        end
    else
        return true, start_path
    end
end

M.extend_results = function(plugin_name, results)
    local ok, conf = pcall(require, "telescope._extensions.mason." .. plugin_name)
    print(ok, conf)
    if ok then
        for _, value in ipairs(conf.results) do
            table.insert(results, value)
        end
    end
    return results
end

M.split = function(inputstr, sep)
   if sep == nil then
      sep = "%s"
   end
   local t={}
   for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      table.insert(t, str)
   end
   return t
end

-- M.get_max_name_width = function(results)
    -- local plugin_name_width = 0
    -- local name
    -- for _, plugin in ipairs(results) do
        -- if type(plugin) == 'table' then
            -- name = plugin.name
        -- else
            -- name = plugin
        -- end
        -- plugin_name_width = #name > plugin_name_width and #name or plugin_name_width
    -- end
    -- return plugin_name_width
-- end

M.get_max_width_map = function (results)
    local res = {}
    for _, spec in ipairs(results) do
        for key, value in pairs(spec) do
            local max_len = res[key] or 0
            res[key] = math.max(max_len, #value)
        end
    end
    return res
end

return M

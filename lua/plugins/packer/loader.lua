local M = {}
local utils = require("utils")

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
        if plugin.config and require("utils").is_install_plugin(name) then
            pcall(plugin.config)
        end
    end
end

M.install_packer = function ()
    -- 下载 packer
    local is_new_install
    if not utils.is_install_plugin("packer.nvim") then
        local install_path = utils.plugin_dir("/packer.nvim")
        vim.notify("正在安装Pakcer.nvim，请稍后...")
        is_new_install = vim.fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
            install_path,
        })
        -- vim.cmd [[packadd packer.nvim]]

        -- https://github.com/wbthomason/packer.nvim/issues/750
        local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
        if not string.find(vim.o.runtimepath, rtp_addition) then
            vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
        end
        vim.notify("Packer.nvim 安装完毕")
    end
    return is_new_install
end

M.setup = function (configs)
    local is_new_install = M.install_packer()
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

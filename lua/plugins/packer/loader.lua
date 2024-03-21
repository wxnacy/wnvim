local M = {}
local utils = require("utils")

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
        -- 插件存储目录
        -- ~/.local/share/nvim/site/pack/packer/start
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

    packer.reset()
    packer.startup({configs})

    -- 新装插件时安装全部
    if is_new_install then
        packer.sync()
    end
    require("plugins.config")
end

return M

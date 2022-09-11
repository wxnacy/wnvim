local M = {}
local utils = require("utils")

local home = require("plugins.packer.config").HOME

-- 判断是否安装
M.is_install_plugin = function (name)
    local install_path = utils.join_path(home, name)
    return utils.is_dir_exists(install_path)
end

-- 安装 packer
M.install_packer = function ()
    -- 下载 packer
    local is_new_install
    if not M.is_install_plugin("packer.nvim") then
        local install_path = home .. "/packer.nvim"
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

return M

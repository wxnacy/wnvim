local lsp_installer = require "nvim-lsp-installer"

-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: 语言 value: 配置文件 }
-- local servers = {
  -- sumneko_lua = require "lsp.lua", -- /lua/lsp/lua.lua
  -- gopls = require "lsp.go", -- /lua/lsp/go.lua
  -- pylsp = require "lsp.python",
  -- jdtls = require "lsp.java",
-- }

-- 自动安装 LanguageServers
-- for name, _ in pairs(servers) do
  -- local server_is_found, server = lsp_installer.get_server(name)
  -- if server_is_found then
    -- if not server:is_installed() then
      -- vim.notify("Installing " .. name)
      -- server:install()
      -- vim.notify("Success Install " .. name)
    -- end
  -- end
-- end

lsp_installer.setup({
    -- automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- local lspconfig = require("lspconfig")
local on_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    -- 绑定快捷键
    require('keybindings').maplsp(buf_set_keymap)
    -- 高亮相同单词
    require 'illuminate'.on_attach()
end


local opts = {}

opts.on_attach = on_attach
opts.flags = {
    debounce_text_changes = 150,
}

local filetype = vim.bo.filetype

local filetype_lsps = {
    go = 'gopls',
    python = 'pylsp',
    lua = 'sumneko_lua',
    java = 'jdtls',
}

local lsp_name = filetype_lsps[filetype]
if lsp_name then
    local status, language_config = pcall(require, "lsp." .. filetype)
    if status then
        opts = vim.tbl_deep_extend("force", language_config, opts)
    end
    require("lspconfig")[lsp_name].setup(opts)
end


-- lsp_installer.on_server_ready(function(server)
  -- local opts = servers[server.name]
  -- if opts then
    -- opts.on_attach = function(_, bufnr)
      -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      -- -- 绑定快捷键
      -- require('keybindings').maplsp(buf_set_keymap)
      -- -- 高亮相同单词
      -- require 'illuminate'.on_attach()
    -- end
    -- opts.flags = {
      -- debounce_text_changes = 150,
    -- }
    -- server:setup(opts)
  -- end
-- end)

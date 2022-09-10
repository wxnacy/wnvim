local ok, lsp_installer = pcall(require, 'mason-lspconfig')
if not ok then
    vim.notify('mason-lspconfig not install')
    return
end

local lsp_config = require("lsp.config")

-- 加载需要下载的 lsp server
local ensure_installed = {}
for lsp_name, _ in pairs(lsp_config.servers) do
    table.insert(ensure_installed, lsp_name)
end

-- 启动 mason-lspconfig
lsp_installer.setup({
    --确保下载的 lsp server
    ensure_installed = ensure_installed,
    -- 是否自动下载
    automatic_installation = true,
})

-- 触发方法
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    -- 绑定快捷键
    require('keybindings').maplsp(buf_set_keymap)
    -- 高亮相同单词
    require 'illuminate'.on_attach(client)
end

-- lsp 启动配置
local opts = {}
opts.on_attach = on_attach
opts.flags = {
    debounce_text_changes = 150,
}

-- 启动触发 lsp
-- https://github.com/williamboman/nvim-config/blob/main/plugin/lsp/setup.lua
local lspconfig = require("lspconfig")
lsp_installer.setup_handlers {
    -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
    function (server_name)
        local language_config = lsp_config.servers[server_name]
        if language_config then
            -- 加载本地配置并启动
            opts = vim.tbl_deep_extend("force", language_config, opts)
            lspconfig[server_name].setup(opts)
        end
    end,
    -- You can also override the default handler for specific servers by providing them as keys, like so:
    -- ["rust_analyzer"] = function ()
        -- require("rust-tools").setup {}
        -- end
}

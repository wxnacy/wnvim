local ok, lsp_installer = pcall(require, 'mason-lspconfig')
if not ok then
    vim.notify('mason-lspconfig not install')
    return
end

-- 启动 mason-lspconfig
lsp_installer.setup({
    --确保下载的 lsp server
    ---启动到 lua/plugins/config/mason.lua 实现
    ensure_installed = {},
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
local function setup_lsp(name)
    local language_config = require("lsp.config").servers[name]
    if language_config then
        -- 加载本地配置并启动
        opts = vim.tbl_deep_extend("force", language_config, opts)
        require("lspconfig")[name].setup(opts)
    end
end
local function auto_setup_lsp(name)
    if vim.tbl_contains(require("lsp.config").autoload_servers, name) then
        setup_lsp(name)
    end
end
lsp_installer.setup_handlers {
    -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
    auto_setup_lsp,
    -- You can also override the default handler for specific servers by providing them as keys, like so:
    -- ["rust_analyzer"] = function ()
        -- require("rust-tools").setup {}
        -- end
}

vim.api.nvim_create_user_command("LSPStart", function(opts)
    local name = opts.fargs[1]
    if name then
        print('setup', name)
        setup_lsp(name)
    end
end, {
    nargs = 1,
    complete = function(_, line)
        local l = vim.split(line, "%s+")
        local keys = vim.tbl_keys(require("lsp.config").servers)
        return vim.tbl_filter(function(val)
            return vim.startswith(val, l[#l])
        end, keys)
    end,
})


local M = {}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- 服务列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
M.servers = {
    lua_ls = require "lsp.lua", -- /lua/lsp/lua.lua
    gopls = require "lsp.go", -- /lua/lsp/go.lua
    -- pylsp = require "lsp.python",
    jedi_language_server = require "lsp.python",
    jdtls = require "lsp.java",
    bashls = {},
    -- 需要当前目录添加 tsconfig.js 文件
    -- {
        -- "compilerOptions": {
            -- "module": "commonjs",
            -- "target": "es6",
            -- "checkJs": false
        -- },
        -- "exclude": [
        -- "node_modules"
        -- ]
    -- }
    tsserver = {},      -- js
    -- quick_lint_js = {},
    html = {capabilities = capabilities},
    cssls = {}, -- css
    yamlls = {},        -- yaml
    volar = {
        filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue'}
    },        -- vue
}

-- 自动启动的服务
M.autoload_servers = {
    "lua_ls",
    "gopls",
    "jedi_language_server",
    -- jdtls = {},
}

return M

local M = {}

-- 服务列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
M.servers = {
    sumneko_lua = require "lsp.lua", -- /lua/lsp/lua.lua
    -- ["lua-language-server"] = require "lsp.lua", -- /lua/lsp/lua.lua
    gopls = require "lsp.go", -- /lua/lsp/go.lua
    -- pylsp = require "lsp.python",
    jedi_language_server = require "lsp.python",
    -- ["jedi-language-server"] = require "lsp.python",
    jdtls = require "lsp.java",
    bashls = {},
    -- ["bash-language-server"] = {},
    -- tsserver = {},
    quick_lint_js = {},
    html = {},
    yamlls = {},        -- yaml
    -- ["quick-lint-js"] = {},
}

return M

local M = {}

-- 服务列表
-- nvim-lint 某些 mason 并不支持下载
-- https://github.com/mfussenegger/nvim-lint#available-linters
-- null-ls 更加符合 mason 支持范围
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#diagnostics
M.servers = {
    "flake8",           -- python
    "markdownlint",     -- markdown
    "shellcheck",       -- shell
    "eslint_d",         -- js
    -- "stylelint",        -- css
    "cfn-lint",         -- json
    "yamllint",         -- yaml
}

return M

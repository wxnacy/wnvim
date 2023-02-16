local M = {}

-- 服务列表
M.servers = {
    -- "black",         -- python
    "autopep8",         -- python
    -- black vs autopep8 https://juejin.cn/s/python%20formatter%20autopep8%20vs%20black%20vs%20yapf
    "markdownlint",     -- markdown
    "eslint_d",         -- js
    "prettierd",        -- css
    "jq",               -- json
    "yamlfmt",          -- yaml
    "shfmt",            -- shell
    -- "google_java_format",     -- java
    "clang_format",     -- java
}


return M

local M = {}

function M.setup()
  -- 加载 Go 语言的 LSP 配置
  require("plugins.lazy.go.lsp").setup()
end

return M
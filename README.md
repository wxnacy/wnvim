# Neovim 配置 (Lazy 版本)

这是一个基于 Lazy 插件管理器的 Neovim 配置。

## 优化 gopls 性能问题

针对 gopls 在首次保存文件时卡顿的问题，已经进行了以下优化：

### 1. gopls 配置优化

在 [lsp.lua](./lua/plugins/lazy/lsp.lua) 中对 gopls 进行了专门的性能优化配置：

- 禁用了 LSP 自带的格式化功能，改用专门的格式化工具（conform.nvim）
- 添加了防抖设置，减少不必要的请求
- 启用了内存优化选项
- 配置了更精确的分析选项

### 2. 格式化工具优化

在 [formatter.lua](./lua/plugins/lazy/formatter.lua) 中配置了专门的 Go 语言格式化工具：

- 使用 `goimports` 和 `gofumpt` 进行代码格式化
- 配置了保存时自动格式化
- 提高了格式化效率，避免了 gopls 在保存时的性能瓶颈

### 3. 自动刷新功能

为了解决添加新依赖后需要重启 Neovim 的问题，增加了以下功能：

- 自动监视 `go.mod` 和 `go.sum` 文件变化，当这些文件被修改时自动刷新 gopls
- 添加了手动刷新命令：
  - `:GoLspRefresh` - 刷新 gopls 缓存
  - `:GoLspReload` - 重新加载整个工作区
- 在 Go 文件中可以使用 `<leader>R` 快捷键重新加载工作区

### 4. 性能优化效果

这些优化应该能显著改善以下问题：
- 首次保存 Go 文件时的卡顿
- 大型项目的响应速度
- 代码补全和诊断的响应时间
- 添加新依赖后需要重启的问题

## LSP

### Golang

#### 自动刷新功能

为了解决添加新依赖后 gopls 无法自动识别的问题，我们实现了以下解决方案：

1. **自动监视文件变化**：当 `go.mod` 或 `go.sum` 文件发生变化时会自动刷新 gopls
2. **手动刷新命令**：
   - `:GoLspRefresh` - 刷新 gopls 缓存
   - `:GoLspReload` - 重新加载整个工作区
3. **快捷键**：在 Go 文件中可以使用 `<leader>R` 快捷键重新加载工作区

#### 使用方法

1. **自动刷新**：当你运行 `go get` 或 `go mod tidy` 后保存 `go.mod` 文件时，会自动刷新 gopls
2. **手动刷新**：
   - 在命令模式下输入 `:GoLspRefresh` 刷新缓存
   - 在命令模式下输入 `:GoLspReload` 重新加载整个工作区
   - 在 Go 文件中按 `<leader>R` 重新加载工作区（默认 `<leader>` 是空格键）

#### 代码组织

Go 语言相关的 LSP 配置已独立封装在 [go/lsp.lua](./lua/plugins/lazy/go/lsp.lua) 文件中，便于维护和管理。

## 插件结构

- [basic.lua](./lua/basic.lua) - 基础配置
- [keybindings.lua](./lua/keybindings.lua) - 快捷键配置
- [plugins/](./lua/plugins/) - 插件配置目录
  - [lazy/](./lua/plugins/lazy/) - Lazy 插件配置
    - [lsp.lua](./lua/plugins/lazy/lsp.lua) - 通用 LSP 配置
    - [formatter.lua](./lua/plugins/lazy/formatter.lua) - 代码格式化配置
    - [go/](./lua/plugins/lazy/go/) - Go 语言专用配置
      - [lsp.lua](./lua/plugins/lazy/go/lsp.lua) - Go 语言 LSP 配置

## 使用说明

1. 首次使用会自动安装 Lazy 插件管理器
2. Mason 会自动安装所需的 LSP 服务器和格式化工具
3. 保存 Go 文件时会自动进行格式化
4. 当 `go.mod` 或 `go.sum` 文件发生变化时会自动刷新 gopls
5. 可以使用以下命令手动刷新：
   - `:GoLspRefresh` - 刷新 gopls 缓存
   - `:GoLspReload` - 重新加载整个工作区
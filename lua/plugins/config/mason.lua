local ok, mason = require("utils").require('mason', true)
if not ok then
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    keymaps = {
        -- Keymap to expand a package
        toggle_package_expand = "<CR>",
        -- Keymap to install the package under the current cursor position
        install_package = "i",
        -- Keymap to reinstall/update the package under the current cursor position
        update_package = "u",
        -- Keymap to check for new version for the package under the current cursor position
        check_package_version = "c",
        -- Keymap to update all installed packages
        update_all_packages = "U",
        -- Keymap to check which installed packages are outdated
        check_outdated_packages = "C",
        -- Keymap to uninstall a package
        uninstall_package = "X",
        -- Keymap to cancel a package installation
        cancel_installation = "<C-c>",
        -- Keymap to apply language filter
        apply_language_filter = "<C-f>",
    }
})

local _ok, mason_installer = require("utils").require("mason-tool-installer", true)
if not _ok then
    return
end

-- 确保下载的列表
local ensure_installed = {}

local append_ensure_installed = function (servers)
    for _, item in ipairs(servers) do
        local name, pck_name
        if type(item) == 'table' then
            name = item[1]
        else
            name = item
        end
        pck_name = require("plugins.config.mason-null-ls").get_mason_package_name(name)
        if pck_name then
            table.insert(ensure_installed, pck_name)
        -- else
            -- require("utils").notify_warn("Mason not found " .. name)
        end
    end
end

-- load lsp servers
local lspconfig_to_package = require("mason-lspconfig.mappings.server").lspconfig_to_package
for lsp_name, _ in pairs(require("lsp.config").servers) do
    -- 转换 mason 名称
    local pck_name = lspconfig_to_package[lsp_name]
    table.insert(ensure_installed, pck_name)
end

-- 加载 linter 的下载列表
append_ensure_installed(require("linter.config").servers)
-- 加载 formater 的下载列表
append_ensure_installed(require("formatter.config").servers)

mason_installer.setup {
  -- a list of all tools you want to ensure are installed upon
  -- start; they should be the names Mason uses for each tool
  ensure_installed = ensure_installed,
  -- ensure_installed = {

    -- you can pin a tool to a particular version
    -- { 'golangci-lint', version = '1.47.0' },

    -- you can turn off/on auto_update per tool
    -- { 'bash-language-server', auto_update = true },

    -- 'lua-language-server',
  -- },

  -- if set to true this will check each tool for updates. If updates
  -- are available the tool will be updated. This setting does not
  -- affect :MasonToolsUpdate or :MasonToolsInstall.
  -- Default: false
  auto_update = false,

  -- automatically install / update on startup. If set to false nothing
  -- will happen on startup. You can use :MasonToolsInstall or
  -- :MasonToolsUpdate to install tools and check for updates.
  -- Default: true
  run_on_start = true,

  -- set a delay (in ms) before the installation starts. This is only
  -- effective if run_on_start is set to true.
  -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
  -- Default: 0
  start_delay = 100, -- 3 second delay
}

-- 完成下载或更新后自动通知
require("config").autocmd('User', {
    pattern = 'MasonToolsUpdateCompleted',
    group = require("config").auto_group,
    callback = function()
        -- vim.notify 'mason-tool-installer has finished'
        print('mason-tool-installer has finished')
        -- vim.schedule(vim.notify 'mason-tool-installer has finished')
    end,
})
